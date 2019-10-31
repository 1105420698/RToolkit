//
//  Rift.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 8/19/19.
//

import Foundation

/// A collection of errors that can be thrown when calculating with `RKNodes`.
public enum CalculationError: Error {
    /// Returns when an unsupported operator is used.
    case invalidOperator
    /// Returns when an unsupported number of inputs is used
    case inputOverflow
    /// Returns when an unsupported input is used.
    case invalidInput
}

/// The main `RKNode` which supports an indefinite amount of `children`.
public class RKNode<T> {
    /// The initial value of the `RKNode`.
    public var value: T
    /// The parent of the `RKNode`.
    public weak var parent: RKNode?

    /// Specify the children of the `RKNode` here.
    public var children: [RKNode] = []
    /// Specify the operator of the `RKNode` here.
    public var operatorInput: String?

    /// Obtains a basic `RKNode`.
    public init(value: T, operator operatorInput: String?) {
        self.value = value
        self.operatorInput = operatorInput
    }

    /// Adding a child to the `RKNode`.
    public func add(child: RKNode) {
        children.append(child)
        child.parent = self
    }
}

/// This extension converts `RKNode` into readable `String`.
extension RKNode: CustomStringConvertible {
    public var description: String {
        var text = "\(value)"

        if !children.isEmpty {
            text += " (" + children.map { $0.description }.joined(separator: ", ") + ") "
        }
        return text
    }
}

/// This extension allows search with `value` for `RKNode`.
extension RKNode where T: Equatable {
    /// Search for the `children` of a `RKNode` with its `value`
    public func search(value: T) -> RKNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

/// R(unkai)(s)ift, made by Runkai, on Swift
public struct RKRift {
    /**
     Use this function to evaluate the `children` of a `RKNode`
     - warning:
        - This version of RunkaiKit only supports **2** `children`
        - The `children` **cannot** have any of their own `children`
     - parameters:
        - input: A RKNode initialized with a `Int`
     - Returns: The result of the operation with type `Int`
     */
    public func evaluateInt(for input: RKNode<Int>) throws -> Int {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operatorInput {
                    switch operation {
                    case "+": return input.children[0].value + input.children[1].value
                    case "-": return input.children[0].value - input.children[1].value
                    case "*": return input.children[0].value * input.children[1].value
                    case "/": return input.children[0].value / input.children[1].value
                    default: throw CalculationError.invalidOperator
                    }
                } else {
                    throw CalculationError.invalidOperator
                }
            } else {
                throw CalculationError.invalidInput
            }
        } else {
            throw CalculationError.inputOverflow
        }
    }

    /**
    Use this function to evaluate the `children` of a `RKNode`
    - warning:
       - This version of RunkaiKit only supports **2** `children`
       - The `children` **cannot** have any of their own `children`
    - parameters:
       - input: A RKNode initialized with a `Float`
    - Returns: The result of the operation with type `Float`
    */
    public func evaluateFloat(for input: RKNode<Float>) throws -> Float {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operatorInput {
                    switch operation {
                    case "+": return input.children[0].value + input.children[1].value
                    case "-": return input.children[0].value - input.children[1].value
                    case "*": return input.children[0].value * input.children[1].value
                    case "/": return input.children[0].value / input.children[1].value
                    default: throw CalculationError.invalidOperator
                    }
                } else {
                    throw CalculationError.invalidOperator
                }
            } else {
                throw CalculationError.invalidInput
            }
        } else {
            throw CalculationError.inputOverflow
        }
    }

    /**
    Use this function to evaluate the `children` of a `RKNode`
    - warning:
       - This version of RunkaiKit only supports **2** `children`
       - The `children` **cannot** have any of their own `children`
    - parameters:
       - input: A RKNode initialized with a `Double`
    - Returns: The result of the operation with type `Double`
    */
    public func evaluateDouble(for input: RKNode<Double>) throws -> Double {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operatorInput {
                    switch operation {
                    case "+": return input.children[0].value + input.children[1].value
                    case "-": return input.children[0].value - input.children[1].value
                    case "*": return input.children[0].value * input.children[1].value
                    case "/": return input.children[0].value / input.children[1].value
                    default: throw CalculationError.invalidOperator
                    }
                } else {
                    throw CalculationError.invalidOperator
                }
            } else {
                throw CalculationError.invalidInput
            }
        } else {
            throw CalculationError.inputOverflow
        }
    }
}
