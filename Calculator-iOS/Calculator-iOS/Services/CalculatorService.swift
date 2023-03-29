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
            let lastChar = operationsHistory.removeLast()
//            if lastChar.isNumber || lastChar == "." {
//                updateResult()
//            }
        }
    }
    
    func add(_ num: Double) {
        operationsHistory += "\(num)+"
        currentResult += num
    }
    
    func subtract(_ num: Double) {
        operationsHistory += "\(num)-"
        currentResult -= num
    }
    
    func divide(_ num: Double) {
        operationsHistory += "\(num)/"
        currentResult /= num
    }
    
    func multiply(_ num: Double) {
        operationsHistory += "\(num)*"
        currentResult *= num
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
    
//    private func updateResult() {
//        let expression = NSExpression(format: operationsHistory)
//        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
//            currentResult = result
//        }
//    }
    
}
