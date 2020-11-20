//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import XCTest
@testable import DekaStandardLibrary

final class ArrayCommonTests: XCTestCase {
    
    func testChunck() {
        let array = ["1", "2", "3", "4", "5"]
        let arrayChunckBy2 = array.chunked(into: 2)
        
        XCTAssertEqual(arrayChunckBy2.count, 3)
        XCTAssertEqual(arrayChunckBy2[0][0], "1")
        XCTAssertEqual(arrayChunckBy2[1][1], "4")
        XCTAssertEqual(arrayChunckBy2[2][0], "5")
    }
}
