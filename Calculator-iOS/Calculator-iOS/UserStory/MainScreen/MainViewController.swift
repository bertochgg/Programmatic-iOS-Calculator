//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
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
        
        setupBackground()
        exampleImage()
        setupOutputLabels()
        addMainStackViewWithRows()
        
    }
    
}

extension MainViewController {
    
    func exampleImage() {
        let exampleImage: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "X - 3")
            image.alpha = 0.4
            image.frame = view.bounds
            return image
        }()
        view.addSubview(exampleImage)
        
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0)
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = view.bounds
        effectView.contentView.layer.addSublayer(gradientLayer)
        effectView.alpha = 1
        view.addSubview(effectView)
    }
    
    func addMainStackViewWithRows() {
        
        // MARK: - Main Stack View
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.spacing = 20
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillProportionally
        view.addSubview(mainStackView)
        setMainStackViewConstraints(stack: mainStackView)
        
        // MARK: - Main Stack -> Left Stack View
        let leftStackView = UIStackView()
        leftStackView.axis = .vertical
        leftStackView.spacing = 30
        leftStackView.distribution = .fillProportionally
        
        let leftTopRowStackViews = leftStackViewData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 20
            
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
            }
            return stackView
            
        }
        
        let leftTopStackView = UIStackView(arrangedSubviews: leftTopRowStackViews)
        leftTopStackView.axis = .vertical
        leftTopStackView.spacing = 20
        
        leftTopStackView.distribution = .fillEqually
        
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
                    button.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 2 / 3).isActive = true
                    
                }
            }
            return stackView
        }
        
        let leftBottomStackView = UIStackView(arrangedSubviews: leftBottomRowStackView)
        leftBottomStackView.axis = .vertical
        leftBottomStackView.spacing = 20
        leftBottomStackView.distribution = .fill
        
        leftStackView.addArrangedSubview(leftTopStackView)
        leftStackView.addArrangedSubview(leftBottomStackView)
        
        // MARK: - Main Stack -> Right Stack View
        let rightTopRowStackViews = rightStackViewData.map { row in
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
                    button.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.156).isActive = true
                    // stackView.widthAnchor.constraint(equalTo: sta.widthAnchor, multiplier: 0.3).isActive = true
                }
            }
            return stackView
        }
        
        let rightTopStackView = UIStackView(arrangedSubviews: rightTopRowStackViews)
        rightTopStackView.axis = .vertical
        rightTopStackView.spacing = 20
        rightTopStackView.distribution = .fill
        
        // MARK: - Add subStackViews to Main Stack View
        mainStackView.addArrangedSubview(leftStackView)
        mainStackView.addArrangedSubview(rightTopStackView)
        
    }
    
    func setMainStackViewConstraints(stack: UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            stack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.82 / 8)
        ])
    }
    
    func setupOutputLabels() {
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.backgroundColor = .systemMint
            stackView.spacing = 0
            return stackView
        }()
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -34),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)
        ])
        
        let operationsLabel: UILabel = {
            let label = UILabel()
            label.text = "6000/2+3227*2"
            label.font = UIFont(name: "Poppins", size: 24)
            label.textColor = .gray
            label.textAlignment = .right
            label.numberOfLines = 0
            
            label.backgroundColor = .systemPink
            return label
        }()
        
        let resultLabel: UILabel = {
            let label = UILabel()
            label.text = "=12,454"
            label.font = UIFont(name: "Poppins", size: 48)
            label.font = .systemFont(ofSize: 48, weight: .medium)
            label.textColor = .black
            label.textAlignment = .right
            label.backgroundColor = .blue
            return label
        }()
        
        operationsLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
        
        stackView.addArrangedSubview(operationsLabel)
        stackView.addArrangedSubview(resultLabel)
    }
    
}
