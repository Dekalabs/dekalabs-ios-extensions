//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit

extension UINavigationController {
    
    public func previousViewController<T: UIViewController>(from viewController: UIViewController,
                                                            previousType: T.Type) -> T? {
        if let i = viewControllers.firstIndex(of: viewController), i > 0 {
            return viewControllers[i-1] as? T
        } else {
            return nil
        }
    }
}
