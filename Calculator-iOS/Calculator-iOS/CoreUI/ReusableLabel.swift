//
//  NormalButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 13/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableLabelProtocol {
    func setupLabel(size: CGFloat, weight: UIFont.Weight, color: UIColor)
}

extension ReusableLabelProtocol where Self: UILabel {
    func setupLabel(size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        // Font configuration
        self.backgroundColor = .clear
        self.font = UIFont(name: "Poppins", size: size)
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
        self.textColor = color
        // Set text
        self.textAlignment = .right
        self.text = "Hola"
    }
}

class ReusableLabel: UILabel, ReusableLabelProtocol {}
