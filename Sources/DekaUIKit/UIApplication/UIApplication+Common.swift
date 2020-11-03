//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit
import os.log

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
    
    public func call(number: String?) {
        guard let value = number else {
            os_log(.default, "No number")
            return
        }
        
        guard let numberURL = URL(string: "tel://" + value.replacingOccurrences(of: " ", with: "")) else {
            os_log(.default, "Can't create URL for number: %@", value)
            return
        }
        
        open(numberURL, options: [:], completionHandler: nil)
    }
}
