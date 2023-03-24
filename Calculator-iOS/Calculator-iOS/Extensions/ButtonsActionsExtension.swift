//
//  ButtonsActionsExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension MainViewController {
    
    @objc
    func buttonTapped(_ sender: CalculatorButton) {
        if let key = sender.currentTitle {
            
            print("The user tapped \(key) button")
            
        } else if let image = sender.currentImage {
            
            print("The user tapped\(image.sfSymbolName ?? "Not a SF Symbol") button")
            
        }
        
    }
    
}

