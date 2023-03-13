//
//  ImageButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 13/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableImageButton {
    func setupButtonWithImage(image img: UIImage)
}

extension ReusableImageButton where Self: UIButton {
    func setupButtonWithImage(image img: UIImage) {
        // Font configuration
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.35)
        // Set image
        self.setImage(img.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        // Box configuration
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.1
        self.layer.borderColor = UIColor.white.cgColor
    }
}

class ImageButton: UIButton, ReusableImageButton {}
