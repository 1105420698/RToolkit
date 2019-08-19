//
//  Rift.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 8/19/19.
//

import Foundation

/// A collection of errors that can be thrown when calculating with `RKNodes`.
enum CalculationError: Error {
    case invalidOperator
    case inputOverflow
    case invalidInput
}

/// The main `RKNode` which supports an indefinite amount of `children`.
class RKNode<T> {
    var value: T
    weak var parent: RKNode?
    
    var children: [RKNode] = []
    var operators: String?
    
    init(value: T, operators: String?) {
        self.value = value
        self.operators = operators
    }
    
    func add(child: RKNode) {
        children.append(child)
        child.parent = self
    }
}

/// This extension converts `RKNode` into readable `String`.
extension RKNode: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " (" + children.map { $0.description }.joined(separator: ", ") + ") "
        }
        return text
    }
}

/// This extension allows search with `value` for `RKNode`.
extension RKNode where T: Equatable {
    func search(value: T) -> RKNode? {
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
public class RKRift {
    /**
     Use this function to evaluate the `children` of a `RKNode`
     - warning:
        - This version of RunkaiKit only supports **2** `children`
        - The `children` **cannot** have any of their own `children`
     - parameters:
        - input: A RKNode initialized with a `Int`
     - Returns: The result of the operation with type `Int`
     */
    func evaluateInt(for input: RKNode<Int>) throws -> Int {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operators {
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
    func evaluateFloat(for input: RKNode<Float>) throws -> Float {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operators {
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
    func evaluateDouble(for input: RKNode<Double>) throws -> Double {
        if input.children.count == 2 {
            if input.children[0].children.count == 0 && input.children[1].children.count == 0 {
                if let operation = input.operators {
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
