//
//  ReusableStackView.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

protocol ReusableStackViewProtocol {
    func setupStackView(viewModel: ReusableStackViewModel)
    func setupStackViewWithLeftTopData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController)
    func setupStackViewWithLeftBottomData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController)
    func setupStackViewWithRightData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController)
}

class ReusableStackView: UIStackView, ReusableStackViewProtocol {
    
    let stackViewsStyles = StackViewsStyles()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView(viewModel: ReusableStackViewModel) {
        self.axis = viewModel.axis
        self.spacing = viewModel.spacing
        self.distribution = viewModel.distribution
    }
    
    func setupStackViewWithLeftTopData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController) {
        
        let leftTopRowStackViews = stackViewData.leftTopStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: stackViewsStyles.leftTopStackView)
            
            for data in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: data.style, content: data.content)
                button.accessibilityIdentifier = data.identifier
                stackView.addArrangedSubview(button)
                
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = .vertical
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
    func setupStackViewWithLeftBottomData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController) {
        
        let leftTopRowStackViews = stackViewData.leftBottomStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: stackViewsStyles.leftBottomStackView)
            
            for data in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: data.style, content: data.content)
                button.accessibilityIdentifier = data.identifier
                stackView.addArrangedSubview(button)
                if data.content == .digit("0") {
                    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.92 / 3).isActive = true
                } else if data.content == .specialSymbol(".") {
                    button.contentVerticalAlignment = .top
                    button.contentHorizontalAlignment = .center
                }
                
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
    func setupStackViewWithRightData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, viewController: UIViewController) {
        let leftTopRowStackViews = stackViewData.rightStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: stackViewsStyles.rightStackView)
            
            for data in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: data.style, content: data.content)
                button.accessibilityIdentifier = data.identifier
                stackView.addArrangedSubview(button)
                
                if data.content == .specialSymbol("+") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.263).isActive = true
                    
                } else if data.content == .specialSymbol("*") || data.content == .specialSymbol("-") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.155).isActive = true
                    
                }
                
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
}
