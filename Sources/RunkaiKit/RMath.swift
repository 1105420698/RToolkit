//
//  RMath.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/24/19.
//

import Foundation

/// A structure that contains all of the RMath functions.
public struct RMFunction {
    
    /// A power function, where both k and n are constants, creates a parabola.
    public class power {
        /// A constant.
        public var k: Double
        /// A constant, the exponent of `x`.
        public var n: Double
        /// The lower bound of `x` in the calculation.
        public var xLowerBound: Int
        /// The upper bound of `x` in the calculation.
        public var xUpperBound: Int
        
        /// Initialize a power function with two constants: `k` and `n`.
        init(k: Double, n: Double, xLowerBound: Int, xUpperBound: Int) {
            self.k = k
            self.n = n
            self.xLowerBound = xLowerBound
            self.xUpperBound = xUpperBound
        }
        
        /// Calculate the power function with the values it has.
        public func calculate(completionHandler: ([Double]) -> Void) {
            var result = [Double]()
            
            for x in xLowerBound...xUpperBound {
                if x != xUpperBound {
                    let answer = k * pow(Double(x), n)
                    result.append(answer)
                } else {
                    let answer = k * pow(Double(x), n)
                    result.append(answer)
                }
            }
            
            completionHandler(result)
        }
    }
}
