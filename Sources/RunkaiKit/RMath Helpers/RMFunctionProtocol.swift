//
//  RMFunction.swift
//  RunkaiKit
//
//  Created by Runkai Zhang on 10/28/19.
//

import Foundation

public protocol RMFunctionProtocol {
    var id: String { get set }
    var xLowerBound: Int { get set }
    var xUpperBound: Int { get set }
    func translation(x: Int, y: Double, completionHandler: ([Int:Double]) -> Void)
}
