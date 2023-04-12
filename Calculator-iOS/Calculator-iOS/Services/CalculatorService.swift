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
    private var currentResult: Double = 0
    
    func clearAll() {
        operationsHistory = "0"
        currentResult = 0
    }
    
    func clearLastInput() {
        if !operationsHistory.isEmpty {
            print(operationsHistory)
            operationsHistory.removeLast()
        }
    }
    
    func setLastResult(_ newValue: Double) {
        currentResult = newValue
    }
    
    func getLastResult() -> Double {
        return currentResult
    }
    
    func setOperationsHistory(_ newHistory: String) {
        if ["+", "*", "/"].contains(newHistory.first) {
            operationsHistory = "0"
        } else {
            operationsHistory = newHistory
        }
        
    }
    
    func getOperationsHistory() -> String {
        return operationsHistory
    }
    
    func updateResult() {
        guard !operationsHistory.isEmpty else {
            return
        }
        
        // Check if the expression ends with an operator and remove it
        let expressionString = operationsHistory
        let operators = ["+", "-", "*", "/"]
        let decimalPoint = "."
        if let lastChar = operationsHistory.last, operators.contains(String(lastChar)) {
            return
        } else if let lastChar = operationsHistory.last, decimalPoint.contains(String(lastChar)) {
            return
        }

        let expression = NSExpression(format: expressionString).toFloatingPointDivision()
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            currentResult = result
        } else {
            print("Expression could not be evaluated")
        }
    }
    
}
