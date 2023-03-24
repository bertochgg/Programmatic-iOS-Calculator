//
//  RightStackViewExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension MainViewController {
    func createRightStackView() -> UIStackView {
        // MARK: - Main Stack -> Right Stack View
        let rightRowStackViews = StackViewsData.rightStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(ButtonsActions.buttonTapped), for: .touchUpInside)
                if content == .sfSymbol("plus") {
                    
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.263).isActive = true
                    
                } else if content == .sfSymbol("asterisk") || content == .sfSymbol("minus") {
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.153).isActive = true
                    
                }
            }
            return stackView
        }
        
        let rightStackView = UIStackView(arrangedSubviews: rightRowStackViews)
        rightStackView.axis = .vertical
        rightStackView.spacing = 20
        rightStackView.distribution = .fill
        
        return rightStackView
    }
}
