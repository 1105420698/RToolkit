//
//  RMFunction.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/28/19.
//

import Foundation

/// The blueprint for `RMFunction`.
public protocol RMFunctionProtocol {
    /// The `RMFunctionDelegate` that will be handling the function's status.
    var delegate: RMFunctionDelegate? { get }
    /// The id for the function, can be any `Int` number as long as it is unique.
    var id: String { get set }
    /// The lower bound of `x` in the calculation.
    var xLowerBound: Int { get set }
    /// The upper bound of `x` in the calculation.
    var xUpperBound: Int { get set }
    /// The `Range` of `x` generated from the `xLowerBound` and `xUpperBound`.
    var xRange: ClosedRange<Int> { get set }
    /// Calculate the function with its values it has but applied with transitions.
    func translation(x: Int, y: Double, completionHandler: ([Int:Double]) -> Void)
    /// Calculate the function with a given `x` value.
    func resultFor(x: Int) -> Double
    /// Calculate the function with the given bounds.
    func calculate(completionHandler: (([Int:Double]) -> Void)?) -> [Int:Double]
}
