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
        let commonButton = CommonButton()
        view.addSubview(commonButton)
        commonButton.setupButton(with: ReusableCommonButton(key: "Ac", fontName: "Poppins", fontSize: 32, colorText: .white, cornerRadius: 16, borderWidght: 1.2, borderColor: .white, bgColor: .white))
        commonButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            commonButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            commonButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
