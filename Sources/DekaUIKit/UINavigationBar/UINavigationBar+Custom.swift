//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UINavigationBar {
    
    public func setClear() {
        backgroundColor = .clear
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
