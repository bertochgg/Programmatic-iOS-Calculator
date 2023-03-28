//
//  CalculatorService.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

class CalculatorService: CalculatorServiceProtocol {
    
    private var history: String = "Hola"
    private var result: Double = 0
    
    func clearLastInput() {
        if !history.isEmpty {
            history.removeLast()
        }
    }
    
    func add(number: Double) {
        result += number
        history += "+\(number)"
    }
    
    func subtract(number: Double) {
        result -= number
        history += "-\(number)"
    }
    
    func divide(number: Double) {
        if number != 0 {
            result /= number
            history += "/\(number)"
        } else {
            history = ""
            result = 0
        }
    }
    
    func multiply(number: Double) {
        result *= number
        history += "*\(number)"
    }
    
    var lastResult: Double {
        return result
    }
    
    var inputHistory: String {
        return history
    }
    
    
}
