//
//  CalculatorServiceProtocol.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 22/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

protocol CalculatorServiceProtocol {
    
    func clearLastInput()
    func getLastResult() -> Double
    func getOperationsHistory() -> String
    
}
