//
//  String.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/29/19.
//

import Foundation

/// Expands `String` capabilities.
public extension String {
    /// Check whether the `String` can be converted into an `Int`.
    var isInt: Bool {
        return Int(self) != nil
    }
}
