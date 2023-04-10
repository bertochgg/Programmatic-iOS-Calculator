//
//  ButtonStyles.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

class ButtonStyles {
    
    let cleanButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: UIConstants.cleanButtonTextColor ?? .white,
                                           cornerRadius: 16,
                                           borderWidght: 0,
                                           borderColor: UIConstants.cleanBackgroundColor ?? .white,
                                           bgColor: UIConstants.cleanBackgroundColor ?? .white)
    
    let operatorButton = ReusableCommonButton(fontName: "Poppins",
                                              fontSize: 32,
                                              colorText: UIConstants.operatorButtonTextColor ?? .white,
                                              cornerRadius: 12,
                                              borderWidght: 0,
                                              borderColor: UIConstants.operatorsBackgroundColor ?? .white,
                                              bgColor: UIConstants.operatorsBackgroundColor ?? .white)
    
    let digitButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: UIConstants.digitButtonTextColor ?? .white,
                                           cornerRadius: 16,
                                           borderWidght: 1.4,
                                           borderColor: .white,
                                           bgColor: UIConstants.numberPadBackgroundColor ?? .white)
    
    let equalButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: UIConstants.equalButtonTextColor ?? .white,
                                           cornerRadius: 12,
                                           borderWidght: 0,
                                           borderColor: UIConstants.equalBackgroundColor ?? .white,
                                           bgColor: UIConstants.equalBackgroundColor ?? .white)
}
