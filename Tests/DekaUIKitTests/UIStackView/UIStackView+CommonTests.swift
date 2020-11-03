//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import XCTest
@testable import DekaUIKit

final class UIStackViewCommonTests: XCTestCase {
    
    func testremoveAllArrangedSubviews() {
        let stackView = UIStackView()
        stackView.addArrangedSubview(UIView())
        
        XCTAssertEqual(stackView.arrangedSubviews.count, 1)
        
        stackView.removeAllArrangedSubviews()
        
        XCTAssertEqual(stackView.arrangedSubviews.count, 0)
    }
}
