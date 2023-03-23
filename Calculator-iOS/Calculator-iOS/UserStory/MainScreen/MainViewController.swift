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
    
    let deleteButton = ReusableCommonButton(fontName: "Poppins",
                                            fontSize: 32,
                                            colorText: .gray,
                                            cornerRadius: 16,
                                            borderWidght: 1.2,
                                            borderColor: .white,
                                            bgColor: UIConstants.transparent,
                                            shadowColor: .white)
    
    let operatorButton = ReusableCommonButton(fontName: "Poppins",
                                              fontSize: 32,
                                              colorText: .systemBlue,
                                              cornerRadius: 12,
                                              borderWidght: 1.2,
                                              borderColor: .white,
                                              bgColor: UIConstants.transparent,
                                              shadowColor: .systemBlue)
    
    let normalCommonButton = ReusableCommonButton(fontName: "Poppins",
                                                  fontSize: 32,
                                                  colorText: .systemIndigo,
                                                  cornerRadius: 16,
                                                  borderWidght: 1.2,
                                                  borderColor: .white,
                                                  bgColor: UIConstants.transparent,
                                                  shadowColor: .white)
    
    let equalButton = ReusableCommonButton(fontName: "Poppins",
                                           fontSize: 32,
                                           colorText: .white,
                                           cornerRadius: 12,
                                           borderWidght: 1.2,
                                           borderColor: .white,
                                           bgColor: UIConstants.transparent,
                                           shadowColor: .blue)
    
    lazy var leftStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.specialSymbol("Ac"), normalCommonButton),
         (.sfSymbol("delete.left"), deleteButton),
         (.specialSymbol("/"), operatorButton)],
        
        [(.digit("7"), normalCommonButton),
         (.digit("8"), normalCommonButton),
         (.digit("9"), normalCommonButton)],
        
        [(.digit("4"), normalCommonButton),
         (.digit("5"), normalCommonButton),
         (.digit("6"), normalCommonButton)],
        
        [(.digit("1"), normalCommonButton),
         (.digit("2"), normalCommonButton),
         (.digit("3"), normalCommonButton)]
    ]
    
    lazy var rightStackViewData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.sfSymbol("asterisk"), operatorButton),
         (.sfSymbol("minus"), operatorButton),
         (.sfSymbol("plus"), operatorButton),
         (.specialSymbol("="), equalButton)]
    ]
    
    lazy var zeroSVData: [[(ButtonContent, ReusableCommonButton)]] = [
        [(.digit("0"), normalCommonButton),
         (.digit("·"), normalCommonButton)]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBackground()
        // exampleImage()
        setupOutputLabels()
        addMainStackViewWithRows()
        
    }
    
}

extension MainViewController {
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemIndigo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = view.bounds
        effectView.contentView.layer.addSublayer(gradientLayer)
        effectView.alpha = 1
        view.addSubview(effectView)
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
        let leftBottomRowStackView = zeroSVData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
                
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
            // stackView.backgroundColor = .systemMint
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
    
    @objc func buttonTapped(_ sender: CalculatorButton) {
        if let key = sender.currentTitle {
            print(key)
        } else if let image = sender.currentImage {
            print(image)
        }
        
    }
    
}
