//
//  CalculatorServiceProtocol.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

protocol CalculatorServiceProtocol {
    
    func clearAll()
    func clearLastInput()
    func getLastResult() -> Double
    func getOperationsHistory() -> String
    
    func setOperationsHistory(_ newHistory: String)
    func updateResult()
    
}
