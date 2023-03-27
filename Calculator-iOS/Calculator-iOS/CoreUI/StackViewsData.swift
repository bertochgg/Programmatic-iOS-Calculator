//
//  StackViewsData.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class StackViewsData {
    
    let leftTopStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.specialSymbol("Ac"), ButtonStyles.acButton),
         (.sfSymbol("delete.left"), ButtonStyles.deleteButton),
         (.specialSymbol("/"), ButtonStyles.operatorButton)],
        
        [(.digit("7"), ButtonStyles.digitButton),
         (.digit("8"), ButtonStyles.digitButton),
         (.digit("9"), ButtonStyles.digitButton)],
        
        [(.digit("4"), ButtonStyles.digitButton),
         (.digit("5"), ButtonStyles.digitButton),
         (.digit("6"), ButtonStyles.digitButton)],
        
        [(.digit("1"), ButtonStyles.digitButton),
         (.digit("2"), ButtonStyles.digitButton),
         (.digit("3"), ButtonStyles.digitButton)]
    ]
    
    let rightStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.sfSymbol("asterisk"), ButtonStyles.operatorButton),
         (.sfSymbol("minus"), ButtonStyles.operatorButton),
         (.sfSymbol("plus"), ButtonStyles.operatorButton),
         (.specialSymbol("="), ButtonStyles.equalButton)]
    ]
    
    let leftBottomStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.digit("0"), ButtonStyles.digitButton),
         (.digit("·"), ButtonStyles.digitButton)]
    ]
    
}
