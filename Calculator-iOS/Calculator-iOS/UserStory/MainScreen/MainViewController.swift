//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let stackViewData = StackViewsData()
    let stackViewsStyles = StackViewsStyles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBackground()
        fetchOutputUI()
        fetchCalculatorUI()
    }
    
}
