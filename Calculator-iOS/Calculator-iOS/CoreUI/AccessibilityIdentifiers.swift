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
        case clearAll = "main-screen.clearAll.button"
        case delete = "main-screen.delete.button"
        case divide = "main-screen.divide.button"
        case seven = "main-screen.seven.button"
        case eight = "main-screen.eight.button"
        case nine = "main-screen.nine.button"
        case four = "main-screen.four.button"
        case five = "main-screen.five.button"
        case six = "main-screen.six.button"
        case one = "main-screen.one.button"
        case two = "main-screen.two.button"
        case three = "main-screen.three.button"
    }
    
    enum LeftBottomIdentifiers: String, CaseIterable {
        case zero = "main-screen.zero.button"
        case decimalPoint = "main-screen.decimalPoint.button"
    }
    
    enum RightIdentifiers: String, CaseIterable {
        case multiply = "main-screen.multiply.button"
        case minus = "main-screen.minus.button"
        case plus = "main-screen.plus.button"
        case equal = "main-screen.equal.button"
    }
    
    enum LabelIdentifiers: String, CaseIterable {
        case history = "main-screen.history.label"
        case result = "main-screen.result.label"
    }
    
}
