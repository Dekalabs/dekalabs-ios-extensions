import Foundation
import UIKit

extension String {
    public func isValidEmail(strict: Bool = false) -> Bool {
        let emailRegex: String
        if strict {
            emailRegex = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        } else {
            emailRegex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        }
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    public func replace(string: String, for mewString: String) -> String {
        return self.replacingOccurrences(of: string, with: mewString, options: .literal, range: nil)
    }
    
    public func size(font: UIFont) -> CGSize {
        return (self as NSString).size(withAttributes: [NSAttributedString.Key.font: font])
    }

    public func isValidPassword() -> Bool {
        guard let regex = try? NSRegularExpression(
            pattern: "^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$"
        ) else {
            return false
        }
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: utf16.count)) != nil
    }
}
