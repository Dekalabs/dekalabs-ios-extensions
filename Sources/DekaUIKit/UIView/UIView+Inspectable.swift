//
//  UIView+Inspectable.swift
//  
//
//  Created by Ginés Navarro Fernández on 29/10/2020.
//

import UIKit
import CoreGraphics

extension UIView {
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
