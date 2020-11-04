//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 04/11/2020.
//

import XCTest
@testable import DekaFundation

final class URLComponentsCommonTest: XCTestCase {
    
    func testValidURL() {
        let host = "dekalabs.com"
        let path = "/users/ios/"
        let url = URLComponents.urlWith(host: host, path: path)
        
        XCTAssertEqual(url, "https://dekalabs.com/users/ios/")
    }
    
    func testWrongHost() {
        let host = "dekalabs/users"
        let path = "/ios/"
        let url = URLComponents.urlWith(host: host, path: path)
        
        XCTAssertNotEqual(url, "https://dekalabs/users/ios/")
    }
    
    func testWrongPath() {
        let host = "dekalabs.com"
        let path = "users/ios/"
        let url = URLComponents.urlWith(host: host, path: path)
        
        XCTAssertTrue(url.isEmpty)
    }
    
    func testCustomScheme() {
        let scheme = "ssl"
        let host = "dekalabs.com"
        let path = "/users/ios/"
        let url = URLComponents.urlWith(scheme: scheme, host: host, path: path)
        
        XCTAssertEqual(url, "ssl://dekalabs.com/users/ios/")
    }
}
