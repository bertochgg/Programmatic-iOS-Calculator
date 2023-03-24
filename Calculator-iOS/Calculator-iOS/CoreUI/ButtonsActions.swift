//
//  ButtonsActions.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class ButtonsActions {
    
    @objc
    func buttonTapped(_ sender: CalculatorButton) {
        if let key = sender.currentTitle {
            
            print("The user tapped \(key) button")
            
        } else if let image = sender.currentImage {
            
            print("The user tapped\(image.getSfSymbolName()) button")
            
        }
        
    }
    
}
