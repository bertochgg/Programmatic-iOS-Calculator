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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        addMainStackViewWithRows()
        
    }
    
}

extension MainViewController {
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 4.0, y: 0)
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        effectView.frame = view.bounds
        effectView.contentView.layer.addSublayer(gradientLayer)
        effectView.alpha = 1
        view.addSubview(effectView)
    }
    
    func addMainStackViewWithRows() {
        
        let buttonData: [[(ButtonContent, ReusableCommonButton)]] = [
            [(.specialSymbol("Ac"), normalCommonButton),
             (.sfSymbol("delete.left"), deleteButton),
             (.sfSymbol("divide"), operatorButton),
             (.sfSymbol("multiply"), operatorButton)],
            
            [(.digit("7"), normalCommonButton),
             (.digit("8"), normalCommonButton),
             (.digit("9"), normalCommonButton),
             (.sfSymbol("minus"), operatorButton)],
            
            [(.digit("4"), normalCommonButton),
             (.digit("5"), normalCommonButton),
             (.digit("6"), normalCommonButton),
             (.sfSymbol("plus"), operatorButton)],
            
            [(.digit("1"), normalCommonButton),
             (.digit("2"), normalCommonButton),
             (.digit("3"), normalCommonButton)],
            
            [(.digit("0"), normalCommonButton),
             (.digit("."), normalCommonButton),
             (.specialSymbol("="), equalButton)]
        ]
        
        let rowStackViews = buttonData.map { row in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            for (content, viewModel) in row {
                let button = CalculatorButton()
                button.setupButton(with: viewModel, content: content)
                stackView.addArrangedSubview(button)
            }
            return stackView
        }
        
        let overallStackView = UIStackView(arrangedSubviews: rowStackViews)
        overallStackView.axis = .vertical
        overallStackView.spacing = 10
        overallStackView.distribution = .fillEqually
        view.addSubview(overallStackView)
        
        setMainStackViewConstraints(stack: overallStackView)
    }
    
    func setMainStackViewConstraints(stack: UIStackView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300)
        ])
    }
    
}
