//
//  OperatorButton.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 13/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableCommonButtonProtocol {
    func setupButton(with viewModel: ReusableCommonButton, content: ButtonContent)
}

enum ButtonContent {
    case text(String)
    case symbol(String)
}

final class CalculatorButton: UIButton, ReusableCommonButtonProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    func setupButton(with viewModel: ReusableCommonButton, content: ButtonContent) {
        
        switch content {
        case .text(let text):
            self.setTitle(text, for: .normal)
            self.setImage(nil, for: .normal)
        case .symbol(let symbolName):
            let buttonIcon = UIImage(systemName: symbolName, withConfiguration: UIImage.SymbolConfiguration(scale: .large))
            self.setTitle(nil, for: .normal)
            self.setImage(buttonIcon!.withTintColor(.gray, renderingMode: .alwaysOriginal), for: .normal)
        }
        
        self.titleLabel?.textAlignment = .center
        
        self.backgroundColor = viewModel.bgColor
        self.titleLabel?.font = UIFont(name: viewModel.fontName, size: viewModel.fontSize)
        self.titleLabel?.font = .systemFont(ofSize: viewModel.fontSize, weight: .medium)
        self.setTitleColor(viewModel.colorText, for: .normal)
        
        self.layer.cornerRadius = viewModel.cornerRadius
        self.layer.masksToBounds = true
        self.layer.borderWidth = viewModel.borderWidght
        self.layer.borderColor = viewModel.borderColor.cgColor
        
        self.layer.shadowColor = viewModel.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.7
    }
}
