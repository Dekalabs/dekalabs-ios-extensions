//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import XCTest
@testable import DekaStandardLibrary

final class DoubleCommonTests: XCTestCase {
    
    func testValidToInt() {
        let value = Double(12)
        
        XCTAssertEqual(value.toInt(),  12)
    }
}
