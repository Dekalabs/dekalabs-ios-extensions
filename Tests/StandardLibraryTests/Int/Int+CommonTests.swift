//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import XCTest
@testable import StandardLibrary

final class IntCommonTests: XCTestCase {
    
    func testAlphabetFirst() {
        let value = 0
        
        XCTAssertEqual(value.alphabet,  "a")
    }
}
