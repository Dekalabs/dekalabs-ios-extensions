//
//  Bundle+FileTests.swift
//  
//
//  Created by Roberto Broseta Vigara on 5/3/23.
//

@testable import DekaFoundation
import XCTest

final class Bundle_FileTests: XCTestCase {
    func testLoadDataFromFile() throws {
        let data = Bundle.module.loadDataFromFile("test_file.json")
        XCTAssertNotNil(data)
    }
}
