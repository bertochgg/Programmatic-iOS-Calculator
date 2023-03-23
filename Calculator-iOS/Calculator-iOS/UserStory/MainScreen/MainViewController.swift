//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var mainStackView = createMainStackView()
    
    lazy var leftStackView = createLeftStackView()
    
    lazy var leftTopStackView = createLeftTopStackView()
    
    lazy var leftBottomStackView = createLeftBottomStackView()
    
    lazy var rightStackView = createRightStackView()
    
    lazy var leftStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.specialSymbol("Ac"), ButtonStyles.acButton),
         (.sfSymbol("delete.left"), ButtonStyles.deleteButton),
         (.specialSymbol("/"), ButtonStyles.operatorButton)],
        
        [(.digit("7"), ButtonStyles.digitButton),
         (.digit("8"), ButtonStyles.digitButton),
         (.digit("9"), ButtonStyles.digitButton)],
        
        [(.digit("4"), ButtonStyles.digitButton),
         (.digit("5"), ButtonStyles.digitButton),
         (.digit("6"), ButtonStyles.digitButton)],
        
        [(.digit("1"), ButtonStyles.digitButton),
         (.digit("2"), ButtonStyles.digitButton),
         (.digit("3"), ButtonStyles.digitButton)]
    ]
    
    lazy var rightStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.sfSymbol("asterisk"), ButtonStyles.operatorButton),
         (.sfSymbol("minus"), ButtonStyles.operatorButton),
         (.sfSymbol("plus"), ButtonStyles.operatorButton),
         (.specialSymbol("="), ButtonStyles.equalButton)]
    ]
    
    lazy var zeroStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.digit("0"), ButtonStyles.digitButton),
         (.digit("·"), ButtonStyles.digitButton)]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupOutputLabels()
        addMainStackViewWithRows()
        
    }
    
}

extension MainViewController {
    
    func setupBackground() {
        
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
        
    }
    
    func addMainStackViewWithRows() {
        
        view.addSubview(mainStackView)
        setMainStackViewConstraints(stack: mainStackView)
        
        mainStackView.addArrangedSubview(leftStackView)
        leftStackView.addArrangedSubview(leftTopStackView)
        leftStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 5.87 / 8).isActive = true
        leftStackView.addArrangedSubview(leftBottomStackView)
        
        mainStackView.addArrangedSubview(rightStackView)
        
    }
    
    // MARK: - Set up StackViews and Buttons
    func createMainStackView() -> UIStackView {
        // MARK: - Main Stack View
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.spacing = 20
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillProportionally
        return mainStackView
    }
    
    func createLeftStackView() -> UIStackView {
        // MARK: - Main Stack -> Left Stack View
        let leftStackView = UIStackView()
        leftStackView.axis = .vertical
        leftStackView.spacing = 30
        leftStackView.distribution = .fillProportionally
        
        return leftStackView
    }
    
    func createLeftTopStackView() -> UIStackView {
        
        let leftTopRowStackViews = leftStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
            return stackView
        }
        
        let leftTopStackView = UIStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = .vertical
        leftTopStackView.spacing = 20
        leftTopStackView.distribution = .fillEqually
        
        return leftTopStackView
    }
    
    func createLeftBottomStackView() -> UIStackView {
        let leftBottomRowStackView = zeroStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 20
            
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
        
        let leftBottomStackView = UIStackView(arrangedSubviews: leftBottomRowStackView)
        leftBottomStackView.axis = .vertical
        leftBottomStackView.spacing = 20
        leftBottomStackView.distribution = .fill
        
        return leftBottomStackView
    }
    
    func createRightStackView() -> UIStackView {
        // MARK: - Main Stack -> Right Stack View
        let rightRowStackViews = rightStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
    
    // MARK: - Constraints and Labels
    
    func setMainStackViewConstraints(stack: UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.81 / 8)
        ])
    }
    
    func setupOutputLabels() {
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
    
    @objc
    func buttonTapped(_ sender: CalculatorButton) {
        if let key = sender.currentTitle {
            print(key)
        } else if let image = sender.currentImage {
            
            let description = String(describing: image)
            do {
                let regex = try NSRegularExpression(pattern: "symbol\\(system: ([^\\)]+)\\)")
                if let match = regex.firstMatch(in: description, range: NSRange(description.startIndex..., in: description)) {
                    let symbolName = (description as NSString).substring(with: match.range(at: 1))
                    print(symbolName)
                }
            } catch let error {
                print("Error creating regular expression: \(error.localizedDescription)")
            }
        }
        
    }
    
}
