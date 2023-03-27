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

enum ButtonContent: Equatable {
    case digit(String)
    case sfSymbol(String)
    case specialSymbol(String)
}

final class CalculatorButton: UIButton, ReusableCommonButtonProtocol {
    var content: ButtonContent?
    let calculatorService = CalculatorService()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setupButton(with viewModel: ReusableCommonButton, content: ButtonContent) {
        self.content = content
        
        switch content {
        case .digit(let text):
            self.setTitle(text, for: .normal)
            self.setImage(nil, for: .normal)
            
        case .sfSymbol(let symbolName):
            let buttonIcon = UIImage(systemName: symbolName, withConfiguration: UIImage.SymbolConfiguration(scale: .large))
            self.setTitle(nil, for: .normal)
            self.setImage(buttonIcon?.withTintColor(viewModel.colorText, renderingMode: .alwaysOriginal), for: .normal)
            
        case .specialSymbol(let text):
            self.setTitle(text, for: .normal)
            self.setImage(nil, for: .normal)
        }
        
        self.titleLabel?.textAlignment = .center
        
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.minimumScaleFactor = 0.1
        self.titleLabel?.lineBreakMode = .byTruncatingTail
        self.clipsToBounds = true
        
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
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
    }
    
    @objc
    func buttonTapped() {
        guard let content = content else {
            return
        }
        
        switch content {
        case .digit(let text):
            print("The user tapped \(text) button")
            calculatorService.inputHistory
            
        case .sfSymbol(let symbolName):
            print("The user tapped \(symbolName) button")
            
        case .specialSymbol(let text):
            print("The user tapped \(text) button")
        }
    }
}
