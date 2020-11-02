//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UIView {
    
    public func createImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        let snapshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImage
    }
}
