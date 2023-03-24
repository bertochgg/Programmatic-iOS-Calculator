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
    
}
