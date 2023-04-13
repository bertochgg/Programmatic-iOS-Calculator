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
    }
    
    enum LeftBottomIdentifiers: String, CaseIterable {
        case zero = "0"
        case decimalPoint = "."
    }
    
    enum RightIdentifiers: String, CaseIterable {
        case multiply = "*"
        case minus = "-"
        case plus = "+"
        case equal = "="
    }
    
}
