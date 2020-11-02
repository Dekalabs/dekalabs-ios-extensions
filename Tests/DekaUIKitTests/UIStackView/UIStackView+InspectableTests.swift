//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import XCTest
@testable import DekaUIKit

final class UIStackViewInspectableTests: XCTestCase {
    
    func testBackgroundColor() {
        let color: UIColor = .blue
        let stackView = UIStackView()
        stackView.stackBackgroundColor = color
        
        XCTAssertEqual(stackView.subviews[0].backgroundColor, color)
    }
    
    func testCornerRadiusEmpty() {
        let cornerRadius = CGFloat(8)
        let stackView = UIStackView()
        stackView.stackCornerRadius = cornerRadius
        
        XCTAssertEqual(stackView.subviews[0].layer.cornerRadius, cornerRadius)
    }
}
