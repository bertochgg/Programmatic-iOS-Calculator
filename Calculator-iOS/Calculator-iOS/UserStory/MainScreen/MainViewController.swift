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
    let calculatorService: CalculatorServiceProtocol = CalculatorService()
    
    // Output
    let stackView = UIStackView()
    let operationsLabel = UILabel()
    let resultLabel = UILabel()
    
    var tappedButtonValues: [String] = []
    let operators = ["+", "-", "*", "/"]
    var isDecimal = false
    var isOperand = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupOutputLabels()
        calculatorUI()
        
        let calculatorButtonDestination = CalculatorButton()
        calculatorButtonDestination.delegate = self
        
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIConstants.backgroundColor
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
        resultLabel.textColor = UIConstants.resultTextColor ?? .white
        resultLabel.textAlignment = .right
        
        stackView.addArrangedSubview(operationsLabel)
        stackView.addArrangedSubview(resultLabel)
    }
    
    func didChangeOutput(digit: String) {
        switch digit {
        case "Ac":
            clearAll()
        case "delete.left":
            deleteLastDigit(digit)
        case "+", "-", "*", "/":
            handleOperator(digit)
        case "=":
            updateResult()
        default:
            handleDigit(digit)
        }
    }
    
    func clearAll() {
        calculatorService.clearAll()
        operationsLabel.text = calculatorService.getOperationsHistory()
        resultLabel.text = String(calculatorService.getLastResult())
        tappedButtonValues = []
        isDecimal = false
    }
    
    func deleteLastDigit(_ digit: String) {
        calculatorService.clearLastInput()
                
        if !tappedButtonValues.isEmpty {
            tappedButtonValues.removeLast()
        }
        
        if digit == "delete.left" && isOperand && tappedButtonValues.last != "." {
            isDecimal = false
        }
        
        if tappedButtonValues.last == "." {
            isOperand = false
        }
        
        if tappedButtonValues.last == "." && digit == "delete.left" && !isOperand {
            isDecimal = true
            isOperand = true
        } else if tappedButtonValues.last == "." && digit == "delete.left" && isOperand {
            isDecimal = false
            isOperand = false
        }
        
        if let lastChar = tappedButtonValues.last, operators.contains(lastChar) && digit == "delete.left" {
            isOperand = false
            isDecimal = true
            print("hola")
            print(lastChar)
        }

        DispatchQueue.main.async {
            self.operationsLabel.text = self.calculatorService.getOperationsHistory()
            if self.tappedButtonValues.isEmpty {
                self.operationsLabel.text = "0"
            }
        }
    }
    
    func handleOperator(_ digit: String) {
        isDecimal = false
        guard let lastDigit = tappedButtonValues.last else {
            if tappedButtonValues.isEmpty && ["+", "*", "/"].contains(digit) {
                return
            }
            
            // If tappedButtonValues is empty, append the digit and update the UI
            tappedButtonValues.append(digit)
            let operationsString = tappedButtonValues.joined()
            calculatorService.setOperationsHistory(operationsString)
            DispatchQueue.main.async {
                self.operationsLabel.text = self.calculatorService.getOperationsHistory()
            }
            return
        }
        print(tappedButtonValues)
        // Avoids to enter operator symbols next to another
        if ["+", "*", "/"].contains(lastDigit) && ["+", "*", "/", "."].contains(digit) {
            return
        }
        
        // Avoids to enter decimal point after an operator symbol
        if lastDigit == "." && ["+", "-", "*", "/"].contains(digit) {
            return
        }
        
        // Avoids to enter many minus symbol, also avoids to enter operators after a minus symbol
        if lastDigit == "-" && digit == "-" || lastDigit == "-" && ["+", "-", "*", "/"].contains(digit) {
            return
        }
        
        // If the input is valid, append the digit and update the UI
        tappedButtonValues.append(digit)
        let operationsString = tappedButtonValues.joined()
        calculatorService.setOperationsHistory(operationsString)
        DispatchQueue.main.async {
            self.operationsLabel.text = self.calculatorService.getOperationsHistory()
        }
    }
    
    func showResultAlertMessage () {
        let alertController = UIAlertController(title: "Error",
                                                message: "Invalid Operation, please enter missing number",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            alertController.dismiss(animated: true)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func updateResult() {
        guard let lastDigit = tappedButtonValues.last else {
            return
        }
        
        let penultimate = tappedButtonValues[tappedButtonValues.index(tappedButtonValues.endIndex, offsetBy: -2)]
        
        if operators.contains(String(lastDigit)) && operators.contains(String(penultimate)) {
            showResultAlertMessage()
        }
        
        if operators.contains(String(lastDigit)) {
            showResultAlertMessage()
        } else if ".".contains(String(lastDigit)) {
            showResultAlertMessage()
        }
        
        if tappedButtonValues.isEmpty {
            operationsLabel.text = "0"
            resultLabel.text = "0"
            return
        }
        calculatorService.updateResult()
        let result = calculatorService.getLastResult()
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        if let formattedResult = formatter.string(from: NSNumber(value: result)) {
            resultLabel.text = "=\(formattedResult)"
        }
        
    }
    
    func handleDigit(_ digit: String) {
        guard let lastDigit = tappedButtonValues.last else {
            // If tappedButtonValues is empty, append the digit and update the UI
            // Avoids to enter decimal point when array is empty .1341
            if tappedButtonValues.isEmpty && digit == "." {
                return
            }
            
            tappedButtonValues.append(digit)
            let operationsString = tappedButtonValues.joined()
            calculatorService.setOperationsHistory(operationsString)
            DispatchQueue.main.async {
                self.operationsLabel.text = self.calculatorService.getOperationsHistory()
            }
            return
        }
        print(tappedButtonValues)
        
        // Avoids to enter many . consecutively ......
        if lastDigit == "." && digit == "." {
            return
        }
        
        // Avoids to enter a decimal point after an operator /. *.
        if digit == "." && !lastDigit.contains(where: { "0123456789".contains($0) }) {
            return
        }
        
        // Avoids to enter many leading zeros 000.123/0.4524
        if digit == "0" && tappedButtonValues.count == 1 && tappedButtonValues[0] == "0" {
            return // Disallow multiple leading zeros
        }
        
        // Avoids to enter wrong decimal numbers 9.323.23.2
        if digit == "." && isDecimal {
            return
        }
        
        if digit == "." && lastDigit.contains(where: { "0123456789".contains($0) }) {
            isOperand = false
            isDecimal = true
        }
        
        // If the input is valid, append the digit and update the UI
        tappedButtonValues.append(digit)
        let operationsString = tappedButtonValues.joined()
        calculatorService.setOperationsHistory(operationsString)
        DispatchQueue.main.async {
            self.operationsLabel.text = self.calculatorService.getOperationsHistory()
        }
    }
    
}
