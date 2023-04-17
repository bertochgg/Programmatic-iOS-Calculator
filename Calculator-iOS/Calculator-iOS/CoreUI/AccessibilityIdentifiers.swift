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
                return "one"
            case .two:
                return "two"
            case .three:
                return "three"
            case .four:
                return "four"
            case .five:
                return "five"
            case .six:
                return "six"
            case .seven:
                return "seven"
            case .eight:
                return "eight"
            case .nine:
                return "nine"
            case .ac:
                return "clearAll"
            case .delete:
                return "delete"
            case .divide:
                return "divide"
            }
        }
    }
    
    enum LeftBottomIdentifiers: String, CaseIterable {
        case zero = "0"
        case decimalPoint = "."
        
        var name: String {
            switch self {
            case .zero:
                return "zero"
            case .decimalPoint:
                return "decimalPoint"
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
                return "multiply"
            case .minus:
                return "minus"
            case .plus:
                return "plus"
            case .equal:
                return "equal"
            }
        }
    }
    
}
