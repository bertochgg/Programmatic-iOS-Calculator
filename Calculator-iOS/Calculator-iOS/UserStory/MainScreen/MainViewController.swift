//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController, OutputChangerDelegate {
    
    let stackViewData = StackViewsData()
    let stackViewsStyles = StackViewsStyles()
    let calculatorService = CalculatorService()
    
    // Output
    let stackView = UIStackView()
    let operationsLabel = UILabel()
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupOutputLabels()
        calculatorUI()
        
        let calculatorButtonDestination = CalculatorButton()
        calculatorButtonDestination.delegate = self
        
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
                                                        stackViewData: stackViewData)
        leftStackViewR.addArrangedSubview(leftTopStackViewR)
        
        // Left Bottom Stack View
        let leftBottomStackViewR = ReusableStackView()
        leftBottomStackViewR.setupStackViewWithLeftBottomData(viewModel: stackViewsStyles.leftBottomStackView,
                                                              stackViewData: stackViewData)
        leftStackViewR.addArrangedSubview(leftBottomStackViewR)
        
        // Right Stack View
        let rightStackViewR = ReusableStackView()
        rightStackViewR.setupStackViewWithRightData(viewModel: stackViewsStyles.rightStackView,
                                                    stackViewData: stackViewData)
        
        stackView.addArrangedSubview(rightStackViewR)
        
    }
    
    private func setupOutputLabels() {
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = -80
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -34),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1 / 4)
        ])
        
        operationsLabel.text = calculatorService.inputHistory
        operationsLabel.font = UIFont(name: "Poppins", size: 24)
        operationsLabel.textColor = .gray
        operationsLabel.textAlignment = .right
        operationsLabel.numberOfLines = 0
        operationsLabel.sizeToFit()
        
        resultLabel.text = String(calculatorService.lastResult)
        resultLabel.font = UIFont(name: "Poppins", size: 48)
        resultLabel.font = .systemFont(ofSize: 48, weight: .medium)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .right
        
        stackView.addArrangedSubview(operationsLabel)
        stackView.addArrangedSubview(resultLabel)
    }
    
    func didChangeOutput() {
        print("hi it is the delegate")
    }
    
}
