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
    public class Power: RMFunctionProtocol {

        /// The `RMFunctionDelegate` that will be handling this function's status.
        public weak var delegate: RMFunctionDelegate?

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
        /// - Requires: `xLowerBound <= xUpperBound`.
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
                delegate?.calculationProgress([self.id:(x - xLowerBound + 1)])
                if x != xUpperBound {
                    result[x] = resultFor(x: x)
                } else {
                    result[x] = resultFor(x: x)
                }
            }

            completionHandler?(result)
            return result
        }

        /// Calculate the function with its values it has but applied with transitions.
        /// - parameters:
        ///     - x: Use this number to shift the vertex of the graph **horizontally**.
        ///     - y: Use this number to shift the vertex of the graph **vertically**.
        ///     - completionHandler: Handles whatever happens after the translation is completed.
        public func translation(x: Int, y: Double, completionHandler: ([Int:Double]) -> Void) {
            let unmodified = self.calculate(completionHandler: nil)
            var result = [Int:Double]()
            for number in unmodified {
                result[number.key + x] = number.value + y
            }

            completionHandler(result)
        }

        /// Calculate the power function with a given `x` value.
        public func resultFor(x: Int) -> Double {
            return k * pow(Double(x), n)
        }
    }

    /// A custom function.
    /// - Warning: This is an experimental feature and is not complete!
    public class Custom {
        /// The `RMFunctionDelegate` that will be handling this function's status.
        public weak var delegate: RMFunctionDelegate?

        /// The id for this function, can be any `Int` number as long as it is unique.
        public var id: String

        /// The custom input for the function interpreter to process.
        /// - Warning: This is an experimental feature and is not complete! 
        public var function: RMCustomFunctionInput

        /// The lower bound of `x` in the calculation.
        public var xLowerBound: Int

        /// The upper bound of `x` in the calculation.
        public var xUpperBound: Int

        /// The `Range` of `x` generated from the `xLowerBound` and `xUpperBound`.
        public lazy var xRange: ClosedRange<Int> = {
            return self.xLowerBound...self.xUpperBound
        }()

        /// Creates a custom function with bounds.
        /// - Warning: This is an experimental feature and is not complete!
        public init(withId id: String, function: RMCustomFunctionInput, xLowerBound: Int, xUpperBound: Int) {
            self.id = id
            self.xLowerBound = xLowerBound
            self.xUpperBound = xUpperBound
            self.function = function
            self.xRange = xLowerBound...xUpperBound
        }

        /// Calculate the custom function with its values it has.
        /// - Warning: This is an experimental feature and is not complete!
        public func calculate(completionHandler: (([Int:Double]) -> Void)?) -> [Int:Double] {
            return [0:0.00000000]
        }
    }
}
