import XCTest
@testable import RunkaiKit

final class RunkaiKitTests: XCTestCase {
    func testMath() {
        let power = RMFunction.power(withId: "testPower", k: Double(1), n: Double(2), xLowerBound: -5, xUpperBound: 5)
        XCTAssertEqual(power.xRange, -5...5, "This should be exactly the same!")
        let _ = power.calculate { (result) in
            XCTAssertEqual(result, [-5:25, -4:16, -3:9, -2:4, -1:1, 0:0, 1:1, 2:4, 3:9, 4:16, 5:25], "This should be exactly the same!")
        }
        
        let _ = power.calculate(completionHandler: nil)
        
        power.translation(x: 5, y: 0) { (result) in
            XCTAssertEqual(result, [-10:25, -9:16, -8:9, -7:4, -6:1, -5:0, -4:1, -3:4, -2:9, -1:16, 0:25], "This should be exactly the same!")
        }
        
        power.translation(x: 0, y: 5) { (result) in
            XCTAssertEqual(result, [-5:30, -4:21, -3:14, -2:9, -1:6, 0:5, 1:6, 2:9, 3:14, 4:21, 5:30], "This should be exactly the same!")
        }
        
        XCTAssertEqual(power.k, Double(1))
        XCTAssertEqual(power.n, Double(2))
    }
    
    func testRunkaiKit() {
        
    }

    static var allTests = [
        ("testMath", testMath),
        ("testMath", testRunkaiKit),
    ]
}
