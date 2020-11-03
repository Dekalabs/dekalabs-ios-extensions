//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import Foundation
import MapKit

public enum MapsApp {
    case googleMaps
    case appleMaps
    
    fileprivate var scheme: URL {
        switch self {
        case .googleMaps:
            return URL(string:"comgooglemaps://")!
        case .appleMaps:
            return URL(string:"http://maps.apple.com/")!
        }
    }
    
    fileprivate var title: String {
        switch self {
        case .googleMaps:
            return  NSLocalizedString("ALERT_GOOGLE_MAPS", comment: "")
        case .appleMaps:
            return NSLocalizedString("ALERT_APPLE_MAPS", comment: "")
        }
    }
    
    fileprivate func action(with handler: @escaping (UIAlertAction) -> ()) -> UIAlertAction {
        return UIAlertAction(title: self.title, style: .default, handler: handler)
    }
    
    fileprivate var canOpenApp: Bool {
        return UIApplication.shared.canOpenURL(self.scheme)
    }
    
    fileprivate func urlFor(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String) -> URL {
        var urlString = ""
        switch self {
        case .googleMaps:
            urlString = String(format: "comgooglemaps://?q=%.6f,%.6f&center=%.6f,%.6f&zoom=14", arguments: [latitude, longitude])
        case .appleMaps:
            urlString = String(format: "http://maps.apple.com/maps?sll=%.6f,%.6f&z=14", arguments: [latitude, longitude])
        }
        
        return URL(string: urlString)!
    }
    
    fileprivate func open(location: CLLocationCoordinate2D,  markerTitle: String) {
        
        switch self {
        case .googleMaps:
            if canOpenApp {
                UIApplication.shared.open(urlFor(latitude: location.latitude, longitude: location.longitude, title: markerTitle))
            }
        case .appleMaps:
            let placemark = MKPlacemark(coordinate: location, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = markerTitle
            let regionDistance: CLLocationDistance = 1000
            let regionSpan = MKCoordinateRegion(center: location, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            
            mapItem.openInMaps(launchOptions: options)
        }
    }
}

extension UIViewController {
    
    public func openOnAvailableMapApps(location: CLLocationCoordinate2D,
                                       markerTitle: String,
                                       actionSheetTitle: String? = nil,
                                       message: String? = nil,
                                       cancel: String = NSLocalizedString("ALERT_CANCEL", comment: "")) {
        let actionSheet = UIAlertController(title: actionSheetTitle, message: message, preferredStyle: .actionSheet)
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        if MapsApp.googleMaps.canOpenApp {
            actionSheet.addAction(MapsApp.googleMaps.action(with: { _ in
                self.open(location: location, in: .googleMaps, markerTitle: markerTitle)
            }))
        }
        
        if MapsApp.appleMaps.canOpenApp {
            actionSheet.addAction(MapsApp.appleMaps.action(with: { _ in
                self.open(location: location, in: .appleMaps, markerTitle: markerTitle)
            }))
        }
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        if actionSheet.actions.count == 3 {
            present(actionSheet, animated: true)
        } else {
            if MapsApp.googleMaps.canOpenApp {
                self.open(location: location, in: .googleMaps, markerTitle: markerTitle)
            } else {
                self.open(location: location, in: .appleMaps, markerTitle: markerTitle)
            }
        }
    }
    
    public func open(location: CLLocationCoordinate2D,
                     in mapsApp: MapsApp,
                     markerTitle: String) {
        mapsApp.open(location: location, markerTitle: markerTitle)
    }
}
