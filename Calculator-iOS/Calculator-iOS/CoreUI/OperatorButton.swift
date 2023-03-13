//
//  OperatorButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 13/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableOperatorButton {
    func setupButton(with key: String, color: UIColor, bgColor: UIColor)
}

extension ReusableOperatorButton where Self: UIButton {
    func setupButton(with key: String, color: UIColor, bgColor: UIColor) {
        // Font configuration
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.33)
        self.titleLabel?.font = UIFont(name: "Poppins", size: 32)
        self.titleLabel?.font = .systemFont(ofSize: 32, weight: .medium)
        self.setTitleColor(color, for: .normal)
        // Set text
        self.setTitle(key, for: .normal)
        self.titleLabel?.textAlignment = .center
        // Box configuration
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.2
        self.layer.borderColor = UIColor.white.cgColor
        // Shadow configuration
        self.layer.shadowColor = bgColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.7
    }
}

class OperatorButton: UIButton, ReusableOperatorButton {}
