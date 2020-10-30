import XCTest
@testable import DekaUIKit

final class UIViewInspectableTests: XCTestCase {
    
    func testUIViewCornerRadius() {
        let cornerRadius = CGFloat(20)
        let view = UIView()
        view.cornerRadius = cornerRadius
        
        XCTAssertEqual(view.layer.cornerRadius, CGFloat(32))
    }
}
