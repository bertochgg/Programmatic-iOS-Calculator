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
    func setupStackViewWithLeftTopData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis)
    func setupStackViewWithLeftBottomData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis)
    func setupStackViewWithRightData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis)
}

final class ReusableStackView: UIStackView, ReusableStackViewProtocol {
    
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
    
    func setupStackViewWithLeftTopData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis) {
        
        let leftTopRowStackViews = stackViewData.leftTopStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: StackViewsStyles.leftTopStackView)
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = orientation
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
    func setupStackViewWithLeftBottomData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis) {
        
        let leftTopRowStackViews = stackViewData.LeftBottomStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: StackViewsStyles.leftBottomStackView)
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                if content == .digit("0") {
                    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.92 / 3).isActive = true
                }
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = orientation
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
    func setupStackViewWithRightData(viewModel: ReusableStackViewModel, stackViewData: StackViewsData, orientation: NSLayoutConstraint.Axis) {
        
        let leftTopRowStackViews = stackViewData.rightStackViewData.map { row in
            let stackView = ReusableStackView()
            stackView.setupStackView(viewModel: StackViewsStyles.rightStackView)
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                if content == .sfSymbol("plus") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.263).isActive = true
                    
                } else if content == .sfSymbol("asterisk") || content == .sfSymbol("minus") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.155).isActive = true
                    
                }
            }
            return stackView
        }
        
        let leftTopStackView = ReusableStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = orientation
        leftTopStackView.spacing = viewModel.spacing
        leftTopStackView.distribution = viewModel.distribution
        
        self.addArrangedSubview(leftTopStackView)
        
    }
    
    @objc
    func buttonTapped(_ sender: CalculatorButton) {
        if let key = sender.currentTitle {
            print("The user tapped \(key) button")
        } else if let image = sender.currentImage {
            print("The user tapped\(image.sfSymbolName ?? "Not a SF Symbol") button")
        }
        
    }
}
