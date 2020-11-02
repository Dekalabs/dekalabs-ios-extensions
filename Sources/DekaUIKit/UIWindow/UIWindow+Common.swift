//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UIWindow {
    
    func setRootViewController(_ controller: UIViewController,
                               animationOptions: UIView.AnimationOptions?,
                               duration: Double = 0.33) {
        if let animationOptions = animationOptions, rootViewController != nil {
            rootViewController = controller
            UIView.transition(with: self,
                              duration: duration,
                              options: animationOptions,
                              animations: {
                                
            }, completion: nil)
        } else {
            rootViewController = controller
        }
    }
}
