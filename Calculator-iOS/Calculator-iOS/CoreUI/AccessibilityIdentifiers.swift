//
//  AccessibilityIdentifiers.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 12/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

enum AccessibilityIdentifiers {
    
    enum LeftTopIdentifiers: String, CaseIterable {
        case ac = "Ac"
        case delete = "delete.left"
        case divide = "/"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case four = "4"
        case five = "5"
        case six = "6"
        case one = "1"
        case two = "2"
        case three = "3"
        
        var name: String {
            switch self {
            case .one:
                return "main-screen.one.button"
            case .two:
                return "main-screen.two.button"
            case .three:
                return "main-screen.three.button"
            case .four:
                return "main-screen.four.button"
            case .five:
                return "main-screen.five.button"
            case .six:
                return "main-screen.six.button"
            case .seven:
                return "main-screen.seven.button"
            case .eight:
                return "main-screen.eight.button"
            case .nine:
                return "main-screen.nine.button"
            case .ac:
                return "main-screen.clearAll.button"
            case .delete:
                return "main-screen.delete.button"
            case .divide:
                return "main-screen.divide.button"
            }
        }
    }
    
    enum LeftBottomIdentifiers: String, CaseIterable {
        case zero = "0"
        case decimalPoint = "."
        
        var name: String {
            switch self {
            case .zero:
                return "main-screen.zero.button"
            case .decimalPoint:
                return "main-screen.decimalPoint.button"
            }
        }
    }
    
    enum RightIdentifiers: String, CaseIterable {
        case multiply = "*"
        case minus = "-"
        case plus = "+"
        case equal = "="
        
        var name: String {
            switch self {
            case .multiply:
                return "main-screen.multiply.button"
            case .minus:
                return "main-screen.minus.button"
            case .plus:
                return "main-screen.plus.button"
            case .equal:
                return "main-screen.equal.button"
            }
        }
    }
    
    enum Labels: String {
        case history = "main-screen.history.label"
        case result = "main-screen.result.label"
    }
    
}
