//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 04/11/2020.
//

import XCTest
@testable import DekaFoundation

final class JSONDecoderDefaultTest: XCTestCase {
    
    func testDecodeDateDefault() {
        struct Item: Decodable {
            let date: Date
        }
        
        let dataString = "{\"date\" : \"2020-09-19T14:16:42Z\"}"
        let data = dataString.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder.default()
        let item = try! jsonDecoder.decode(Item.self, from: data)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
        let stringItemDate = formatter.string(from: item.date)
        
        XCTAssertEqual(stringItemDate, "09/19/2020 14:16:42")
    }
    
    func testDecodeCustomDateFormatter() {
        struct Item: Decodable {
            let date: Date
        }
        
        let dateFormatter = "MM-dd-yyyy HH::mm::ss"
        let date = "05-16-1986 03::01::02"
        let dataString = "{\"date\" : \"\(date)\"}"
        let data = dataString.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder.default(decodeDateFormat: dateFormatter)
        let item = try! jsonDecoder.decode(Item.self, from: data)
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
        let stringItemDate = formatter.string(from: item.date)
        
        XCTAssertEqual(stringItemDate, date)
    }
    
    func testDecodeWrongDateFormatter() {
        struct Item: Decodable {
            let date: Date
        }
        
        let dateFormatter = "MM-dd-yyyy HH::mm::ss"
        let date = "05/16/1986 03:01:02"
        let dataString = "{\"date\" : \"\(date)\"}"
        let data = dataString.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder.default(decodeDateFormat: dateFormatter)
        let item = try? jsonDecoder.decode(Item.self, from: data)
        
        XCTAssertNil(item)
    }
    
    func testDecodeValidAlternativeDateFormatter() {
        struct Item: Decodable {
            let date: Date
        }
        
        let dateFormatter = "MM-dd-yyyy HH::mm::ss"
        let dateFormatterAlternative = "MM/dd/yyyy HH:mm:ss"
        let date = "05/16/1986 03:01:02"
        let dataString = "{\"date\" : \"\(date)\"}"
        let data = dataString.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder.default(decodeDateFormat: dateFormatter, alternativeDecodeDateFormat: dateFormatterAlternative)
        let item = try! jsonDecoder.decode(Item.self, from: data)
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatterAlternative
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // UTC
        let stringItemDate = formatter.string(from: item.date)
        
        XCTAssertEqual(stringItemDate, date)
    }
    
    func testDecodeWrongDateFormatterAndAlternative() {
        struct Item: Decodable {
            let date: Date
        }
        
        let dateFormatter = "MM-dd-yyyy HH:mm:ss"
        let dateFormatterAlternative = "MM/dd/yyyy HH:mm:ss"
        let date = "05/16/1986 03::01::02"
        let dataString = "{\"date\" : \"\(date)\"}"
        let data = dataString.data(using: .utf8)!
        
        let jsonDecoder = JSONDecoder.default(decodeDateFormat: dateFormatter, alternativeDecodeDateFormat: dateFormatterAlternative)
        let item = try? jsonDecoder.decode(Item.self, from: data)
        
        XCTAssertNil(item)
    }
}
