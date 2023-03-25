//
//  CalculatorUI.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func CalculatorUI() {
        // Main Stack View
        let stackView = ReusableStackView()
        stackView.setupStackView(viewModel: StackViewsStyles.mainStackView)
        view.addSubview(stackView)
        Constraints.setMainStackViewConstraints(stack: stackView, view: view)
        
        // Left Stack View
        let leftStackViewR = ReusableStackView()
        leftStackViewR.setupStackView(viewModel: StackViewsStyles.leftStackView)
        stackView.addArrangedSubview(leftStackViewR)
        leftStackViewR.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 5.87 / 8).isActive = true
        
        // Left Top Stack View
        let leftTopStackViewR = ReusableStackView()
        leftTopStackViewR.setupStackViewWithLeftTopData(viewModel: StackViewsStyles.leftTopStackView,
                                                        stackViewData: stackViewData,
                                                        orientation: .vertical)
        leftStackViewR.addArrangedSubview(leftTopStackViewR)
        
        // Left Bottom Stack View
        let leftBottomStackViewR = ReusableStackView()
        leftBottomStackViewR.setupStackViewWithLeftBottomData(viewModel: StackViewsStyles.leftBottomStackView,
                                                              stackViewData: stackViewData,
                                                              orientation: .vertical)
        leftStackViewR.addArrangedSubview(leftBottomStackViewR)
        
        // Right Stack View
        let rightStackViewR = ReusableStackView()
        rightStackViewR.setupStackViewWithRightData(viewModel: StackViewsStyles.rightStackView,
                                                    stackViewData: stackViewData,
                                                    orientation: .horizontal)
        
        stackView.addArrangedSubview(rightStackViewR)
        
    }
    
}
