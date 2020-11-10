//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import Foundation
import UIKit

extension String {
    
    func isValidEmail(strict: Bool = false) -> Bool {
        let emailRegex: String
        if strict {
            emailRegex = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        } else {
            emailRegex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        }
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    func replace(string: String, for mewString: String) -> String {
        return self.replacingOccurrences(of: string, with: mewString, options: .literal, range: nil)
    }
    
    func size(font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
