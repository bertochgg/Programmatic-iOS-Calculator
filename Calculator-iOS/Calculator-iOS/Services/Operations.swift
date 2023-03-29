//
//  Operations.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 29/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class Operations {
    
    let calculatorService = CalculatorService()
    
    func updateResultLabel(label: UILabel) {
        let operationsHistory = calculatorService.getOperationsHistory()
        let currentResult = calculatorService.getLastResult()
        
        label.text = "\(operationsHistory) = \(currentResult ?? 0.0)"
    }
}
