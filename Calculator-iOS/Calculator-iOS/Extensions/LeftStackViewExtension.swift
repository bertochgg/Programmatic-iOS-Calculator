//
//  LeftStackViewExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension MainViewController {
    func createLeftStackView() -> UIStackView {
        // MARK: - Main Stack -> Left Stack View
        let leftStackView = UIStackView()
        leftStackView.axis = .vertical
        leftStackView.spacing = 30
        leftStackView.distribution = .fillProportionally
        
        return leftStackView
    }
    
    func createLeftTopStackView() -> UIStackView {
        
        let leftTopRowStackViews = StackViewsData.leftStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(ButtonsActions.buttonTapped(_:)), for: .touchUpInside)
            }
            return stackView
        }
        
        let leftTopStackView = UIStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = .vertical
        leftTopStackView.spacing = 20
        leftTopStackView.distribution = .fillEqually
        
        return leftTopStackView
    }
    
    func createLeftBottomStackView() -> UIStackView {
        
        let leftBottomRowStackView = StackViewsData.zeroStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(ButtonsActions.buttonTapped(_:)), for: .touchUpInside)
                if content == .digit("0") {
                    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.92 / 3).isActive = true
                }
            }
            return stackView
        }
        
        let leftBottomStackView = UIStackView(arrangedSubviews: leftBottomRowStackView)
        leftBottomStackView.axis = .vertical
        leftBottomStackView.spacing = 20
        leftBottomStackView.distribution = .fill
        
        return leftBottomStackView
    }
    
//    @objc
//    func buttonTapped(_ sender: CalculatorButton) {
//        if let key = sender.currentTitle {
//
//            print("The user tapped \(key) button")
//
//        } else if let image = sender.currentImage {
//
//            print("The user tapped\(image.getSfSymbolName()) button")
//
//        }
//
//    }
}
