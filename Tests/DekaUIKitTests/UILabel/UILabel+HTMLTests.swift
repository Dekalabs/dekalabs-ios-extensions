//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 02/11/2020.
//

import XCTest
@testable import DekaUIKit

final class UILabelHTMLTests: XCTestCase {
 
    func testValidHTML() {
        let validHTML = """
            <!DOCTYPE html>
            <html>
            <body>

            <h1>My First Heading</h1>

            </body>
            </html>
        """
        let label = UILabel()
        label.setHTMLFromString(text: validHTML)
        
        XCTAssertEqual(label.text, "My First Heading\n")
    }
    
    func testTextPlain() {
        let validHTML = "My First Heading"
        let label = UILabel()
        label.setHTMLFromString(text: validHTML)
        
        XCTAssertEqual(label.text, "My First Heading")
    }
    
    func testInvalidHTML() {
        let invalidHTML = """
            <!DOCTYPE html>

            <h1>My First Heading</h1>

            </body>
            </html>
        """
        let label = UILabel()
        label.setHTMLFromString(text: invalidHTML)
        
        XCTAssertEqual(label.text, "My First Heading\n")
    }
}
