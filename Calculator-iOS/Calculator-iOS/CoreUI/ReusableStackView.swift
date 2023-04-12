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

//enum AccesibilityIdentifiers {
//    enum LeftTopIdentifiers: String, CaseIterable {
//        case Ac = "AcButton", delete = "deleteButton", divide = "divideButton"
//        case seven = "sevenButton", eight = "eightButton", nine = "nineButton"
//        case four = "fourButton", five = "fiveButton", six = "sixButton"
//        case one = "oneButton",  two = "twoButton", three = "threeButton"
//    }
//
//    enum LeftBottomIdentifiers: String, CaseIterable {
//        case zero = "zeroButton", decimalPoint = "decimalPoint"
//    }
//
//    enum RightIdentifiers: String, CaseIterable {
//        case multiply = "multiplyButton"
//        case minus = "minusButton"
//        case plus = "plusButton"
//        case equal = "equalButton"
//    }
//}

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
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: viewModel, content: content)
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
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                if content == .digit("0") {
                    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.92 / 3).isActive = true
                } else if content == .specialSymbol(".") {
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
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.delegate = viewController as? OutputChangerDelegate
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
        
                if content == .specialSymbol("+") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.263).isActive = true
                    
                } else if content == .specialSymbol("*") || content == .specialSymbol("-") {
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
