//
//  StackViewsData.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class StackViewsData {
    
    let buttonStyle = ButtonStyles()
    
    lazy var leftTopStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.specialSymbol("Ac"), buttonStyle.cleanButton),
         (.sfSymbol("delete.left"), buttonStyle.cleanButton),
         (.specialSymbol("/"), buttonStyle.operatorButton)],
        
        [(.digit("7"), buttonStyle.digitButton),
         (.digit("8"), buttonStyle.digitButton),
         (.digit("9"), buttonStyle.digitButton)],
        
        [(.digit("4"), buttonStyle.digitButton),
         (.digit("5"), buttonStyle.digitButton),
         (.digit("6"), buttonStyle.digitButton)],
        
        [(.digit("1"), buttonStyle.digitButton),
         (.digit("2"), buttonStyle.digitButton),
         (.digit("3"), buttonStyle.digitButton)]
    ]
    
    lazy var rightStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.sfSymbol("asterisk"), buttonStyle.operatorButton),
         (.sfSymbol("minus"), buttonStyle.operatorButton),
         (.sfSymbol("plus"), buttonStyle.operatorButton),
         (.specialSymbol("="), buttonStyle.equalButton)]
    ]
    
    lazy var leftBottomStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.digit("0"), buttonStyle.digitButton),
         (.digit("·"), buttonStyle.digitButton)]
    ]
    
}
