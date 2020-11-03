//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit

extension UIStackView {
    
    public func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { allSubviews, subview -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap { $0.constraints })
        
        removedSubviews.forEach { $0.removeFromSuperview() }
    }
}
