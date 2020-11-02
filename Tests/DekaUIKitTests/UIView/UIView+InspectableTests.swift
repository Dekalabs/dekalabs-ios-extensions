//
//  File.swift
//
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import XCTest
@testable import DekaUIKit

final class UIViewInspectableTests: XCTestCase {
    
    func testCornerRadius() {
        let cornerRadius = CGFloat(20)
        let view = UIView()
        view.cornerRadius = cornerRadius
        
        XCTAssertEqual(view.layer.cornerRadius, cornerRadius)
    }
    
    func testBorderWidth() {
        let borderWidth = CGFloat(4)
        let view = UIView()
        view.borderWidth = borderWidth
        
        XCTAssertEqual(view.layer.borderWidth, borderWidth)
    }
    
    func testBorderColor() {
        let borderColor: UIColor = .red
        let view = UIView()
        view.borderColor = borderColor
        
        XCTAssertEqual(view.layer.borderColor, borderColor.cgColor)
    }
    
    func testShadowColor() {
        let shadowColor: UIColor = .red
        let view = UIView()
        view.shadowColor = shadowColor
        
        XCTAssertEqual(view.layer.shadowColor, shadowColor.cgColor)
    }
    
    func testShadowRadius() {
        let shadowRadius = CGFloat(5)
        let view = UIView()
        view.shadowRadius = shadowRadius
        
        XCTAssertEqual(view.layer.shadowRadius, shadowRadius)
    }
    
    func testShadowOpacity() {
        let shadowOpacity = Float(1)
        let view = UIView()
        view.shadowOpacity = shadowOpacity
        
        XCTAssertEqual(view.layer.shadowOpacity, shadowOpacity)
    }
    
    func testShadowOffsetWidth() {
        let shadowOffset = CGFloat(2)
        let view = UIView()
        view.shadowOffsetWidth = shadowOffset
        
        XCTAssertEqual(view.layer.shadowOffset.width, shadowOffset)
    }
    
    func testShadowOffsetHeight() {
        let shadowOffset = CGFloat(3)
        let view = UIView()
        view.shadowOffsetHeight = shadowOffset
        
        XCTAssertEqual(view.layer.shadowOffset.height, shadowOffset)
    }
}
