//
//  ReusableCommonButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 15/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation
import UIKit

struct ReusableCommonButton {
    // let key: String
    let fontName: String
    let fontSize: CGFloat
    let colorText: UIColor
    let cornerRadius: CGFloat
    let borderWidght: CGFloat
    let borderColor: UIColor
    let bgColor: UIColor
    let shadowColor: UIColor
    
    init(fontName: String, fontSize: CGFloat, colorText: UIColor, cornerRadius: CGFloat, borderWidght: CGFloat, borderColor: UIColor, bgColor: UIColor, shadowColor: UIColor) {
        // self.key = key
        self.fontName = fontName
        self.fontSize = fontSize
        self.colorText = colorText
        self.cornerRadius = cornerRadius
        self.borderWidght = borderWidght
        self.borderColor = borderColor
        self.bgColor = bgColor
        self.shadowColor = shadowColor
    }
}
