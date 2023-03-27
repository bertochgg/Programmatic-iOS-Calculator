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
                                           colorText: .gray,
                                           cornerRadius: 16,
                                           borderWidght: 1.2,
                                           borderColor: .white,
                                           bgColor: UIConstants.transparent,
                                           shadowColor: .white)
    
    let operatorButton = ReusableCommonButton(fontName: "Poppins",
                                              fontSize: 32,
                                              colorText: .init(red: 0.06, green: 0.62, blue: 1.0, alpha: 1),
                                              cornerRadius: 12,
                                              borderWidght: 1.2,
                                              borderColor: .white,
                                              bgColor: UIConstants.transparent,
                                              shadowColor: .init(red: 0.10, green: 0.69, blue: 1.0, alpha: 1))
    
    let digitButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: .init(red: 0.22, green: 0.73, blue: 1.0, alpha: 1),
                                           cornerRadius: 16,
                                           borderWidght: 1.2,
                                           borderColor: .white,
                                           bgColor: UIConstants.transparent,
                                           shadowColor: .white)
    
    let equalButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: .white,
                                           cornerRadius: 12,
                                           borderWidght: 1.2,
                                           borderColor: .white,
                                           bgColor: .init(red: 0.10, green: 0.69, blue: 1.0, alpha: 0.5),
                                           shadowColor: .init(red: 0.05, green: 0.29, blue: 1.0, alpha: 1))
}
