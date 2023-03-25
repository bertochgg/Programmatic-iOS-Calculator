//
//  StackViewsStyles.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 24/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

class StackViewsStyles {
    
    static let mainStackView = ReusableStackViewModel(axis: .horizontal,
                                                      spacing: 20,
                                                      distribution: .fillProportionally)
    
    static let leftStackView = ReusableStackViewModel(axis: .vertical,
                                                      spacing: 30,
                                                      distribution: .fillProportionally)
    
    static let leftTopStackView = ReusableStackViewModel(axis: .horizontal,
                                                         spacing: 20,
                                                         distribution: .fillEqually)
    
    static let leftBottomStackView = ReusableStackViewModel(axis: .horizontal,
                                                            spacing: 20,
                                                            distribution: .fill)
    
    static let rightStackView = ReusableStackViewModel(axis: .vertical,
                                                       spacing: 20,
                                                       distribution: .fill)
}
