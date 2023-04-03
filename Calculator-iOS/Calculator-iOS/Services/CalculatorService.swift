//
//  CalculatorService.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

class CalculatorService: CalculatorServiceProtocol {
    
    private var operationsHistory: String = ""
    private var currentResult: Double = 0.0
    
    func clearLastInput() {
        if !operationsHistory.isEmpty {
            print(operationsHistory)
            operationsHistory.removeLast()
        }
    }
    
    func getLastResult() -> Double? {
        return currentResult
    }
    
    func setOperationsHistory(_ newHistory: String) {
        operationsHistory = newHistory
    }
    
    func getOperationsHistory() -> String {
        return operationsHistory
    }
    
    func updateResult() {
        guard !operationsHistory.isEmpty else {
            return
        }
        
        // Check if the expression ends with an operator and remove it
        var expressionString = operationsHistory
        let operators = ["+", "-", "*", "/"]
        if let lastChar = operationsHistory.last, operators.contains(String(lastChar)) {
            expressionString = String(operationsHistory.dropLast())
        }
        
        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            currentResult = result
        }
    }
    
}
