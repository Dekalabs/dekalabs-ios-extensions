//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import Foundation
import XCTest
@testable import DekaStandardLibrary

final class StringValidationTests: XCTestCase {
    
    func testValidEmail() {
        let email = "info@dekalabs.com"
        
        XCTAssertTrue(email.isValidEmail())
    }
    
    func testInvalidUsernameEmail() {
        let email = "@dekalabs.com"
        
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testInvalidSymbolEmail() {
        let email = "info&dekalabs.com"
        
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testInvalidDomainNameEmail() {
        let email = "info&.com"
        
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testInvalidDotEmail() {
        let email = "info@dekalabscom"
        
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testInvalidDomainEmail() {
        let email = "info@dekalabs.c"
        
        XCTAssertFalse(email.isValidEmail())
    }
    
    func testReplaceCommaToPoint() {
        let string = ",Test,String,"
        
        XCTAssertEqual(string.replace(string: ",", for: "."), ".Test.String.")
    }

    func testValidPassword() {
        let password = "testtes1"

        XCTAssertTrue(password.isValidPassword())
    }

    func testPasswordWithoutNumbers() {
        let password = "testtest"

        XCTAssertFalse(password.isValidPassword())
    }

    func testPasswordWithoutLetters() {
        let password = "12345678"

        XCTAssertFalse(password.isValidPassword())
    }

    func testShortPassword() {
        let password = "test123"

        XCTAssertFalse(password.isValidPassword())
    }

    func testEmptyPassword() {
        let password = ""

        XCTAssertFalse(password.isValidPassword())
    }
}
