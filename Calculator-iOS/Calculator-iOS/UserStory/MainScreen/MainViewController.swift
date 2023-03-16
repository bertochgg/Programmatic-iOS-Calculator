//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let calculatorButton = ReusableCommonButton(fontName: "Poppins",
                                      fontSize: 32,
                                      colorText: .systemIndigo,
                                      cornerRadius: 16,
                                      borderWidght: 1.2,
                                      borderColor: .white,
                                      bgColor: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.33),
                                      shadowColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        add()
        
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
    
    func add() {
        let commonButton = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        commonButton.center = view.center
        view.addSubview(commonButton)
        
        commonButton.setupButton(with: calculatorButton, content: .symbol("delete.left"))
        
        //        commonButton.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            commonButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            commonButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        //        ])
    }
}

//func setupCCalculatorButtons() {
//    let stackView = UIStackView()
//    stackView.axis = .vertical
//    stackView.distribution = .fillEqually
//    stackView.spacing = 10
//    view.addSubview(stackView)
//
//    let calculatorButtons = [
//        [
//            ["title": "Ac", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "deleteBtn", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "/", "color": UIColor.blue, "bgColor": UIColor.systemBlue],
//            ["title": "*", "color": UIColor.blue, "bgColor": UIColor.systemBlue]
//        ],
//        [
//            ["title": "7", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "8", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "9", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "-", "color": UIColor.blue, "bgColor": UIColor.systemBlue]
//        ],
//        [
//            ["title": "4", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "5", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "6", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "+", "color": UIColor.blue, "bgColor": UIColor.systemBlue]
//        ],
//        [
//            ["title": "1", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "2", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "3", "color": UIColor.blue, "bgColor": UIColor.white]
//        ],
//        [
//            ["title": "0", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": ".", "color": UIColor.blue, "bgColor": UIColor.white],
//            ["title": "=", "color": UIColor.white, "bgColor": UIColor.blue]
//        ]
//    ]
//
//    for row in calculatorButtons {
//        let rowStackView = UIStackView()
//        rowStackView.axis = .horizontal
//        rowStackView.distribution = .fillEqually
//        rowStackView.spacing = 10
//
//        for buttonData in row {
//            let button = CommonButton()
//
//            if buttonData["title"] == "deleteBtn" {
//                let imageButton = ImageButton()
//                guard let UIImageSetup = UIImage(systemName: "delete.left", withConfiguration: UIImage.SymbolConfiguration(scale: .large)) else { return }
//                imageButton.setupButtonWithImage(image: UIImageSetup)
//                rowStackView.addArrangedSubview(imageButton)
//            } else {
//                button.setupButton(with: ReusableCommonButton(key: buttonData["title"] as! String, fontName: "Poppins", fontSize: 32, colorText: buttonData["color"] as! UIColor, cornerRadius: 16, borderWidght: 1.2, borderColor: .white, bgColor: buttonData["bgColor"] as! UIColor))
//                rowStackView.addArrangedSubview(button)
//            }
//        }
//
//        stackView.addArrangedSubview(rowStackView)
//    }
//
//    stackView.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
