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
    
    var tappedButtonValues: [String] = []
    
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
                                                        stackViewData: stackViewData,
                                                        viewController: self)
        leftStackViewR.addArrangedSubview(leftTopStackViewR)
        
        // Left Bottom Stack View
        let leftBottomStackViewR = ReusableStackView()
        leftBottomStackViewR.setupStackViewWithLeftBottomData(viewModel: stackViewsStyles.leftBottomStackView,
                                                              stackViewData: stackViewData,
                                                              viewController: self)
        leftStackViewR.addArrangedSubview(leftBottomStackViewR)
        
        // Right Stack View
        let rightStackViewR = ReusableStackView()
        rightStackViewR.setupStackViewWithRightData(viewModel: stackViewsStyles.rightStackView,
                                                    stackViewData: stackViewData,
                                                    viewController: self)
        
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
        
        operationsLabel.text = "0"
        operationsLabel.font = UIFont(name: "Poppins", size: 24)
        operationsLabel.textColor = .gray
        operationsLabel.textAlignment = .right
        operationsLabel.numberOfLines = 0
        operationsLabel.sizeToFit()
        
        resultLabel.text = "0"
        resultLabel.font = UIFont(name: "Poppins", size: 48)
        resultLabel.font = .systemFont(ofSize: 48, weight: .medium)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .right
        
        stackView.addArrangedSubview(operationsLabel)
        stackView.addArrangedSubview(resultLabel)
    }
    
    func didChangeOutput(digit: String) {
        
        switch digit {
            
        case "Ac":
            operationsLabel.text = "0"
            resultLabel.text = "0"
            tappedButtonValues = []
            
        case "delete.left":
            calculatorService.clearLastInput()
            if !tappedButtonValues.isEmpty {
                tappedButtonValues.removeLast()
            }
            
            DispatchQueue.main.async {
                self.operationsLabel.text = self.calculatorService.getOperationsHistory()
                if self.tappedButtonValues.isEmpty {
                    self.operationsLabel.text = "0"
                }
            }
            
        case "+", "-", "*", "/":
            // let result = calculatorService.evaluate(expression: tappedButtonValues.joined())
            // operationsLabel.text = result
            // tappedButtonValues = []
            tappedButtonValues.append(digit)
            let operationsString = tappedButtonValues.joined()
            calculatorService.setOperationsHistory(operationsString)
            DispatchQueue.main.async {
                self.operationsLabel.text = self.calculatorService.getOperationsHistory()
            }
            
        case "=":
            print("hola")
            
        default:
            tappedButtonValues.append(digit)
            let operationsString = tappedButtonValues.joined()
            calculatorService.setOperationsHistory(operationsString)
            DispatchQueue.main.async {
                self.operationsLabel.text = self.calculatorService.getOperationsHistory()
            }
        }
    }
    
}
