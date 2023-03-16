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
        addCalculatorButton()
        
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
    
    func addCalculatorButton() {
        let commonButton = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        view.addSubview(commonButton)
        
        commonButton.setupButton(with: calculatorButton, content: .operatorSymbol("delete.left"))
    }
    
    func addStackViewWithButtons() {
        
        //        let buttonTypes: [ButtonContent] = [
        //            .digit("Ac"), .specialSymbol("delete.left"), .operatorSymbol("divide"), .operatorSymbol("multiply"),
        //            .digit("7"), .digit("8"), .digit("9"), .operatorSymbol("minus"),
        //            .digit("4"), .digit("5"), .digit("6"), .operatorSymbol("plus"),
        //            .digit("1"), .digit("2"), .digit("3"),
        //            .digit("0"), .digit("."), .specialSymbol("equal")
        //        ]
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)
        
        let transparent = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.33)
        
        let calculatorButtons = [
            [
                ["key": "Ac",          "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 62, "cornerRadious": 16],
                ["key": "delete.left", "colorText": UIColor.gray,         "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 62, "cornerRadious": 16],
                ["key": "divide",      "colorText": UIColor.blue,         "bgColor": transparent, "shadowColor": UIColor.blue,  "width": 62, "height": 62, "cornerRadious": 12],
                ["key": "multiply",    "colorText": UIColor.blue,         "bgColor": transparent, "shadowColor": UIColor.blue,  "width": 62, "height": 62, "cornerRadious": 12]
            ],
            [
                ["key": "7",     "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "8",     "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "9",     "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white,  "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "minus", "colorText": UIColor.blue,         "bgColor": transparent, "shadowColor": UIColor.blue,  "width": 62, "height": 60, "cornerRadious": 12]
            ],
            [
                ["key": "4",    "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "5",    "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "6",    "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white,  "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "plus", "colorText": UIColor.blue,         "bgColor": transparent, "shadowColor": UIColor.blue,  "width": 62, "height": 96, "cornerRadious": 12]
            ],
            [
                ["key": "1", "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "2", "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 60, "cornerRadious": 16],
                ["key": "3", "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white,  "width": 62, "height": 60, "cornerRadious": 16]
            ],
            [
                ["key": "0",     "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 144, "height": 60, "cornerRadious": 16],
                ["key": ".",     "colorText": UIColor.systemIndigo, "bgColor": transparent, "shadowColor": UIColor.white, "width": 62, "height": 62, "cornerRadious": 16],
                ["key": "equal", "colorText": UIColor.white,        "bgColor": transparent, "shadowColor": UIColor.blue,  "width": 62, "height": 96, "cornerRadious": 12]
            ]
        ]
        
        // Tinte/Color Letra
        // shadowColor
        // widght
        // height
        //cornerRadious
        
        for row in calculatorButtons {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 10
            
            for buttonData in row {
                let button = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
                let calculatorButton = ReusableCommonButton(fontName: "Poppins",
                                                            fontSize: 32,
                                                            colorText: buttonData["colorText"] as! UIColor,
                                                            cornerRadius: buttonData["cornerRadius"] as! CGFloat,
                                                            borderWidght: 1.2,
                                                            borderColor: .white,
                                                            bgColor: buttonData["bgColor"] as! UIColor,
                                                            shadowColor: buttonData["shadowColor"] as! UIColor)
                
                button.setupButton(with: calculatorButton, content: .digit(buttonData["key"] as! String))
                
//                button.setupButton(with: ReusableCommonButton(key: buttonData["title"] as! String, fontName: "Poppins", fontSize: 32, colorText: buttonData["color"] as! UIColor, cornerRadius: 16, borderWidght: 1.2, borderColor: .white, bgColor: buttonData["bgColor"] as! UIColor))
                rowStackView.addArrangedSubview(button)
                
            }
            
            stackView.addArrangedSubview(rowStackView)
        }
    }
}
