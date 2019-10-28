import XCTest
@testable import RunkaiKit

final class RunkaiKitTests: XCTestCase {
    func testMath() {
        let power = RMFunction.power(k: Double(1), n: Double(2), xLowerBound: -5, xUpperBound: 5)
        power.calculate { (result) in
            XCTAssertEqual(result.first, 25, "This should be exactly the same!")
            XCTAssertEqual(result.last, 25, "This should be exactly the same!")
        }
    }

    static var allTests = [
        ("testMath", testMath),
    ]
}
