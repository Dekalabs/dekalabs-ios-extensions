//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit

extension UIPageViewController {
    
    public func removeBounces() {
        for subview in view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.bounces = false
                break;
            }
        }
    }
}
