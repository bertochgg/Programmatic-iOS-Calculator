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
        operationsHistory = newHistory
    }
    
    func getOperationsHistory() -> String {
        return operationsHistory
    }
    
    func updateResult() {
        guard !operationsHistory.isEmpty else {
            return
        }
        
        guard let lastChar = operationsHistory.last else {
            return
        }
        
        // Check if the expression ends with an operator and remove it
        let expressionString = operationsHistory
        let operators = ["+", "-", "*", "/"]
        let decimalPoint = "."
        let penultimate = operationsHistory[operationsHistory.index(operationsHistory.endIndex, offsetBy: -2)]
        if operators.contains(String(lastChar)) {
            return
        } else if decimalPoint.contains(String(lastChar)) {
            print(operationsHistory)
            return
        }
        if operators.contains(String(lastChar)) && operators.contains(String(penultimate)) {
            print(operationsHistory)
            return
        }
        
        let expression = NSExpression(format: expressionString).floatifiedForDivisionIfNeeded
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            currentResult = result
        } else {
            print("Expression could not be evaluated")
        }
    }
    
}
