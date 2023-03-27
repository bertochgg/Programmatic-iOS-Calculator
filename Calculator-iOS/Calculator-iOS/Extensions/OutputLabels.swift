//
//  OutputLabels.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

extension MainViewController {
    
    private func setupOutputLabels() {
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = -80
            return stackView
        }()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -34),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4)
        ])
        
        let operationsLabel: UILabel = {
            let label = UILabel()
            label.text = "6000/2+3227*2"
            label.font = UIFont(name: "Poppins", size: 24)
            label.textColor = .gray
            label.textAlignment = .right
            label.numberOfLines = 0
            label.sizeToFit()
            return label
        }()
        view.addSubview(operationsLabel)
        let resultLabel: UILabel = {
            let label = UILabel()
            label.text = "=12,454"
            label.font = UIFont(name: "Poppins", size: 48)
            label.font = .systemFont(ofSize: 48, weight: .medium)
            label.textColor = .black
            label.textAlignment = .right
            return label
        }()
        
        stackView.addArrangedSubview(operationsLabel)
        stackView.addArrangedSubview(resultLabel)
    }
    
}
