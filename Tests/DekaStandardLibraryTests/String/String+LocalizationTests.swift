//
//  File.swift
//
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import XCTest
@testable import DekaStandardLibrary

final class StringLocalizationTests: XCTestCase {
    
    func testLocalized() {
        let s = "My Localized String"
        let sLocalized = s.localized()
        
        XCTAssertEqual(sLocalized, s)
    }
}
