//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit

extension UIApplication {
    
    public func canOpen(urlString: String) -> Bool {
        if let url = URL(string: urlString) {
            if self.canOpenURL(url) {
                self.open(url, options: [:], completionHandler: nil)
                return true
            }
        }
        return false
    }
}
