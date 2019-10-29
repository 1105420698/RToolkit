//
//  RMath.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/24/19.
//

import Foundation

/// A structure that contains all of the RMath functions.
public struct RMFunction {
    
    /// A power function, where both k and n are constants, creates a parabola when graphed.
    public class power: RMFunctionProtocol {
        
        var delegate: RMFunctionDelegate?
        
        /// The id for this function, can be any `Int` number as long as it is unique.
        public var id: String
        /// A constant, the multiplier of `x`.
        public var k: Double
        /// A constant, the exponent of `x`.
        public var n: Double
        /// The lower bound of `x` in the calculation.
        public var xLowerBound: Int
        /// The upper bound of `x` in the calculation.
        public var xUpperBound: Int
        /// The `Range` of `x` generated from the `xLowerBound` and `xUpperBound`.
        public lazy var xRange: ClosedRange<Int> = {
            return self.xLowerBound...self.xUpperBound
        }()
        
        /// Initializes a standard power function with two constants: kx^n
        /// - parameters:
        ///     - k: A constant, multiplier of `x`.
        ///     - n: A constant, exponent of `x`.
        ///     - xLowerBound: The lower bound of `x` in the calculation.
        ///     - xUpperBound: The upper bound of `x` in the calculation.
        public init(withId id: String, k: Double, n: Double, xLowerBound: Int, xUpperBound: Int) {
            self.id = id
            self.k = k
            self.n = n
            self.xLowerBound = xLowerBound
            self.xUpperBound = xUpperBound
            self.xRange = xLowerBound...xUpperBound
        }
        
        /// Calculate the power function with its values it has.
        public func calculate(completionHandler: (([Int:Double]) -> Void)?) -> [Int:Double] {
            var result = [Int:Double]()
            
            for x in self.xRange {
                delegate?.calculationInSession([self.id:(x - xLowerBound + 1)])
                if x != xUpperBound {
                    let answer = k * pow(Double(x), n)
                    result[x] = answer
                } else {
                    let answer = k * pow(Double(x), n)
                    result[x] = answer
                }
            }
            
            completionHandler?(result)
            return result
        }
        
        /// Calculate the power function with its values it has but applied with transitions.
        public func translation(x: Int, y: Double, completionHandler: ([Int:Double]) -> Void) {
            let unmodified = self.calculate(completionHandler: nil)
            var result = [Int:Double]()
            for number in unmodified {
                result[number.key - x] = number.value + y
            }
            
            completionHandler(result)
        }
    }
}
