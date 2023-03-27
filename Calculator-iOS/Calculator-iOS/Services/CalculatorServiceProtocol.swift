//
//  CalculatorServiceProtocol.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

protocol CalculatorServiceProtocol {
    
    func clearLastInput()// Backslash
    
    func add(number: Double)
    func subtract(number: Double)
    func divide(number: Double)
    func multiply(number: Double)
    
    var lastResult: Double { get }
    var inputHistory: String { get }
}
