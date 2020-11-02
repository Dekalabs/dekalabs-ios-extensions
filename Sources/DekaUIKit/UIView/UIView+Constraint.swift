//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UIView {
    
    func addSubviewOccupingWholeSpace(view: UIView, to topLayoutGuide: UILayoutSupport) {
        if view.superview == self {
            view.removeFromSuperview()
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let topConstraint = NSLayoutConstraint(item: topLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let constraints = [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
        addConstraints(constraints)
    }
    
    func addSubviewOccupingWholeSpace(view: UIView) {
        if view.superview == self {
            view.removeFromSuperview()
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let constraints = [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
        addConstraints(constraints)
    }
}
