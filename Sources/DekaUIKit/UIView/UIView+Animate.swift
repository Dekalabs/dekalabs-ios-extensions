//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UIView {
    
    public func fadeAnimationAlpha(hide: Bool, duration: Double = 0.3) {
        if hide && !isHidden {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0
            }, completion: { success in
                if success == true {
                    self.isHidden = hide
                }
            })
        } else if !hide {
            alpha = 0
            isHidden = hide
            UIView.animate(withDuration: duration) {
                self.alpha = 1
            }
        }
    }
    
    public func fadeAnimationHidden(hide: Bool, duration: Double = 0.3) {
        if hide && !isHidden {
            UIView.animate(withDuration: duration) {
                self.isHidden = hide
                self.alpha = 0
            }
        } else if !hide {
            UIView.animate(withDuration: duration) {
                self.isHidden = hide
                self.alpha = 1
            }
        }
    }
}
