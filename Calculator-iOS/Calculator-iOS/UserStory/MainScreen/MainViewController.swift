//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let stackViewData = StackViewsData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupOutputLabels()
        CalculatorUI()
        
    }
    
}

extension MainViewController {
    
    func setupBackground() {
        
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 0.98, alpha: 1)
        
    }
    
}
