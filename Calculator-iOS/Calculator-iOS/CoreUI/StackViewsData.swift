//
//  StackViewsData.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

typealias identifier = AccessibilityIdentifiers

struct StackViewData {
    
    let content: ButtonContent
    let style: ReusableCommonButton
    let identifier: String
    
}

class StackViewsData {

    lazy var buttonStyle = ButtonStyles()
    
    lazy var leftTopStackViewData: [[(ButtonContent, ReusableCommonButton, String)]] = [
        [(.specialSymbol("Ac"), buttonStyle.cleanButton, identifier.LeftTopIdentifiers.clearAll.rawValue),
         (.sfSymbol("delete.left"), buttonStyle.cleanButton, identifier.LeftTopIdentifiers.delete.rawValue),
         (.specialSymbol("/"), buttonStyle.operatorButton, identifier.LeftTopIdentifiers.divide.rawValue)],
        
        [(.digit("7"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.seven.rawValue),
         (.digit("8"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.eight.rawValue),
         (.digit("9"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.nine.rawValue)],
        
        [(.digit("4"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.four.rawValue),
         (.digit("5"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.five.rawValue),
         (.digit("6"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.six.rawValue)],
        
        [(.digit("1"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.one.rawValue),
         (.digit("2"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.two.rawValue),
         (.digit("3"), buttonStyle.digitButton, identifier.LeftTopIdentifiers.three.rawValue)]
    ]
    
    lazy var rightStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.specialSymbol("*"), buttonStyle.operatorButton),
         (.specialSymbol("-"), buttonStyle.operatorButton),
         (.specialSymbol("+"), buttonStyle.operatorButton),
         (.specialSymbol("="), buttonStyle.equalButton)]
    ]
    
    lazy var leftBottomStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.digit("0"), buttonStyle.digitButton),
         (.specialSymbol("."), buttonStyle.digitButton)]
    ]
    
}
