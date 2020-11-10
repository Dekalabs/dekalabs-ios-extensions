//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import UIKit

extension String {

    func withKern(kern: CGFloat) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.kern : kern])
        return attributedText
    }
    
    func underlined() -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
        return attributedText
    }
    
    func withLineSpacing(spacing: CGFloat) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        return attributedText
    }

    func withColor(color: UIColor) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor : color])
        return attributedText
    }
    
}

extension RangeExpression where Bound == String.Index  {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
