//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import UIKit

extension UILabel {
    
    public func setHTMLFromString(text: String?) {
        guard let text = text else {
            return
        }
        
        let dataText = "<span style=\"font-family: \(font.familyName); font-size: \(font.pointSize)\">\(text)</span>"
        
        guard let data = dataText.data(using: String.Encoding(rawValue: String.Encoding.unicode.rawValue)) else {
            return
        }
        
        if let attrStr = try? NSAttributedString(data: data,
                                                 options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
                                                 documentAttributes: nil) {
            
            // Remove last line break.
            let mutableAttrStr = NSMutableAttributedString(attributedString: attrStr)
            if mutableAttrStr.length > 0 {
                let lastCharRange = NSMakeRange(mutableAttrStr.length - 1, 1)
                let lastChar = mutableAttrStr.attributedSubstring(from: lastCharRange).string
                
                if lastChar == "\n" {
                    mutableAttrStr.deleteCharacters(in: lastCharRange)
                }
            }
            
            attributedText = mutableAttrStr
        }
    }
}
