//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit

extension UIViewController {
    
    public func showAlert(message: String,
                          title: String? = nil,
                          acceptText: String = NSLocalizedString("ALERT_ACCEPT", comment: ""),
                          cancelText: String? = NSLocalizedString("ALERT_CANCEL", comment: ""),
                          confirmHandler okHandler: ((UIAlertAction) -> Void)? = nil,
                          cancelHandler noHandler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.popoverPresentationController?.sourceView = view
        alertController.popoverPresentationController?.sourceRect = view.bounds
        
        let okAction = UIAlertAction(title: acceptText, style: .default, handler: okHandler)
        alertController.addAction(okAction)
        
        if let cancelText = cancelText {
            let noAction = UIAlertAction(title: cancelText, style: .cancel, handler: noHandler)
            alertController.addAction(noAction)
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    public func showAlert(message: String, title: String? = nil) {
        showAlert(message: message, title: title, cancelText: nil)
    }
}
