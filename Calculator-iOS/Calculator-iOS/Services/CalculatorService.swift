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
    
    func getLastResult() -> Double {
        return currentResult
    }
    
    func setOperationsHistory(_ newHistory: String) {
        if ["+", "*", "/"].contains(newHistory.first) {
            operationsHistory = "0"
        } else if ["."].contains(newHistory.first) {
            operationsHistory += "0\(newHistory)"
            // operationsHistory.insert("0", at: operationsHistory.startIndex)
        } else if newHistory.contains("+.") || newHistory.contains("-.") || newHistory.contains("*.") || newHistory.contains("/.") {
            let pattern = "(?<=\\+|\\-|\\*|\\/|^)\\."
            do {
                let regex = try NSRegularExpression(pattern: pattern)
                let range = NSRange(newHistory.startIndex..., in: newHistory)
                let modifiedHistory = regex.stringByReplacingMatches(in: newHistory, options: [], range: range, withTemplate: "0.")
                operationsHistory = modifiedHistory
            } catch let error {
                print("\(error.localizedDescription)")
            }
            
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
