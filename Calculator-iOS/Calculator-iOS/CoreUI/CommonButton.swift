//
//  OperatorButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 13/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableCommonButtonProtocol {
    func setupButton(with viewModel: ReusableCommonButton)
}

struct ReusableCommonButton {
    let key: String
    let fontName: String
    let fontSize: CGFloat
    let colorText: UIColor
    let cornerRadius: CGFloat
    let borderWidght: CGFloat
    let borderColor: UIColor
    let bgColor: UIColor
    
    init(key: String, fontName: String, fontSize: CGFloat, colorText: UIColor, cornerRadius: CGFloat, borderWidght: CGFloat, borderColor: UIColor, bgColor: UIColor) {
        self.key = key
        self.fontName = fontName
        self.fontSize = fontSize
        self.colorText = colorText
        self.cornerRadius = cornerRadius
        self.borderWidght = borderWidght
        self.borderColor = borderColor
        self.bgColor = bgColor
    }
}

final class CommonButton: UIButton, ReusableCommonButtonProtocol {
    
    private let commonButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(commonButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonButton.frame = CGRect(x: 0, y: 0, width: 62, height: 62)
    }
    
    func setupButton(with viewModel: ReusableCommonButton) {
        commonButton.setTitle(viewModel.key, for: .normal)
        commonButton.titleLabel?.textAlignment = .center
        
        commonButton.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.33)
        commonButton.titleLabel?.font = UIFont(name: viewModel.fontName, size: viewModel.fontSize)
        commonButton.titleLabel?.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
        commonButton.setTitleColor(viewModel.colorText, for: .normal)
        
        commonButton.layer.cornerRadius = viewModel.cornerRadius
        commonButton.layer.masksToBounds = true
        commonButton.layer.borderWidth = viewModel.borderWidght
        commonButton.layer.borderColor = viewModel.borderColor.cgColor
        
        commonButton.layer.shadowColor = viewModel.bgColor.cgColor
        commonButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        commonButton.layer.shadowRadius = 10
        commonButton.layer.shadowOpacity = 0.7
    }
}
