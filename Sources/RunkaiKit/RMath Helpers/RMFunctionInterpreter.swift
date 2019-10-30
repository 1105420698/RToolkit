//
//  RMFunctionInterpreter.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/29/19.
//

import Foundation

/// A interpreter that is capable of parsing `RMCustomFunctionInput` and convert them to machine understandable types.
/// - Warning: This is an experimental feature and is not complete!
/// - attention: Currently only supports `f(x) = <Other side of equation>` format.
public class RMFunctionInterpreter {
    
    /// A list of supported symbols.
    /// - Warning: This is an experimental feature and is not complete!
    public let supportedSymbols = ["x", "^", "+", "-", "*", "/", "(", ")"]
    
    /// The input of the interpreter.
    /// - Warning: This is an experimental feature and is not complete!
    public var input: RMCustomFunctionInput
    
    /// Creates a interpreter with a given input.
    /// - Warning: This is an experimental feature and is not complete!
    public init(input: RMCustomFunctionInput) {
        self.input = input
    }
    
    /// The stored symbols after `canBeInterpreted` is calculated.
    /// - Warning: This is an experimental feature and is not complete!
    var storedSymbols: Array<String> = []
    
    var testingSymbols: Array<String> = ["(", "2", "x", "^", "2", "+", "1", ")", "5"]
    
    /// Starts the interpreting process and outputs `RMCustomFunctionOutput`.
    /// - Warning: This is an experimental feature and is not complete!
    public func interprete() -> RMCustomFunctionOutput {
        if canBeInterpreted {
            // TODO: Complete the interpretation cycle.
            for symbol in testingSymbols {
                if symbol.isInt {
                    
                } else if symbol == "(" {
                    
                }
            }
        }
        
        return RMCustomFunctionOutput(value: "")
    }
    
    /// Verifies a custom function to decide whether it can be interpreted or not.
    /// - Warning: This is an experimental feature and is not complete! 
    public var canBeInterpreted: Bool {
        self.storedSymbols.removeAll()
        var tokens = [String]()
        
        for character in input.value {
            for supported in supportedSymbols {
                if character == supported.first || String(character).isInt {
                    tokens.append(String(character))
                } else {
                    return false
                }
            }
        }
        
        self.storedSymbols = tokens
        return true
    }
}
