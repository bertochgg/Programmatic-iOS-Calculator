//
//  Constraints.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

final class Constraints: UIView {
    
    // MARK: - Constraints and Labels
    static func setMainStackViewConstraints(stack: UIStackView, view: UIView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.81 / 8)
        ])
    }
}
