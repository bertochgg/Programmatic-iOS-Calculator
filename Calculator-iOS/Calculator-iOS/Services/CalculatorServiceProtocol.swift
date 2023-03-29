//
//  CalculatorServiceProtocol.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

protocol CalculatorServiceProtocol {
    
    func clearLastInput()
    func add(_ num: Double)
    func subtract(_ num: Double)
    func divide(_ num: Double)
    func multiply(_ num: Double)
    func getLastResult() -> Double?
    func getOperationsHistory() -> String
    
}
