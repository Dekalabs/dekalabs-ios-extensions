import XCTest
@testable import StandardLibrary

final class StringLocalizationTests: XCTestCase {
    
    func testLocalized() {
        let s = "My Localized String"
        let sLocalized = s.localized()
        
        XCTAssertEqual(sLocalized, s)
    }
}
