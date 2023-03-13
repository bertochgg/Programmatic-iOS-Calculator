//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupCCalculatorButtons()
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
    
    func setupCCalculatorButtons() {
        
        // MARK: - Main Stack View
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)
        
        let calculatorButtons = [
            ["Ac", "deleteBtn", "/", "*"],
            ["7", "8", "9", "-"],
            ["4", "5", "6", "+"],
            ["1", "2", "3"],
            ["0", ".", "="]
        ]
        
        for row in calculatorButtons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 10
            
            for buttonTitle in row {
                let button = OperatorButton()
                
                if buttonTitle == "deleteBtn" {
                    let imageButton = ImageButton()
                    guard let UIImageSetup = UIImage(systemName: "delete.left", withConfiguration: UIImage.SymbolConfiguration(scale: .large)) else { return }
                    imageButton.setupButtonWithImage(image: UIImageSetup)
                    rowStackView.addArrangedSubview(imageButton)
                }else if buttonTitle == "/" || buttonTitle == "*" || buttonTitle == "-" || buttonTitle == "+" {
                    button.setupButton(with: buttonTitle, color: .blue, bgColor: .systemBlue)
                    rowStackView.addArrangedSubview(button)
                }else if buttonTitle == "=" {
                    button.setupButton(with: "=", color: .white, bgColor: .blue)
                    rowStackView.addArrangedSubview(button)
                }else {
                    button.setupButton(with: buttonTitle, color: .blue, bgColor: .white)
                    rowStackView.addArrangedSubview(button)
                }
                stackView.addArrangedSubview(rowStackView)
            }
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            ])
        }
    }
    
}
