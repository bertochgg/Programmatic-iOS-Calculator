//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let stackViewData = StackViewsData()
    let stackViewsStyles = StackViewsStyles()
    
    let calculatorService = CalculatorService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupOutputLabels()
        calculatorUI()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
    }
    
    private func calculatorUI() {
        // Main Stack View
        let stackView = ReusableStackView()
        stackView.setupStackView(viewModel: stackViewsStyles.mainStackView)
        view.addSubview(stackView)
        Constraints.setMainStackViewConstraints(stack: stackView, view: view)
        
        // Left Stack View
        let leftStackViewR = ReusableStackView()
        leftStackViewR.setupStackView(viewModel: stackViewsStyles.leftStackView)
        stackView.addArrangedSubview(leftStackViewR)
        leftStackViewR.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 5.87 / 8).isActive = true
        
        // Left Top Stack View
        let leftTopStackViewR = ReusableStackView()
        leftTopStackViewR.setupStackViewWithLeftTopData(viewModel: stackViewsStyles.leftTopStackView,
                                                        stackViewData: stackViewData,
                                                        orientation: .vertical)
        leftStackViewR.addArrangedSubview(leftTopStackViewR)
        
        // Left Bottom Stack View
        let leftBottomStackViewR = ReusableStackView()
        leftBottomStackViewR.setupStackViewWithLeftBottomData(viewModel: stackViewsStyles.leftBottomStackView,
                                                              stackViewData: stackViewData,
                                                              orientation: .vertical)
        leftStackViewR.addArrangedSubview(leftBottomStackViewR)
        
        // Right Stack View
        let rightStackViewR = ReusableStackView()
        rightStackViewR.setupStackViewWithRightData(viewModel: stackViewsStyles.rightStackView,
                                                    stackViewData: stackViewData,
                                                    orientation: .horizontal)
        
        stackView.addArrangedSubview(rightStackViewR)
        
    }
    
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
            label.text = calculatorService.inputHistory
            label.font = UIFont(name: "Poppins", size: 24)
            label.textColor = .gray
            label.textAlignment = .right
            label.numberOfLines = 0
            label.sizeToFit()
            return label
        }()
        
        let resultLabel: UILabel = {
            let label = UILabel()
            label.text = String(calculatorService.lastResult)
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
