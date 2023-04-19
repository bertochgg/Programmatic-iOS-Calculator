//
//  StackViewsData.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 23/03/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import UIKit

typealias identifier = AccessibilityIdentifiers

struct ButtonData {
    var content: ButtonContent
    var style: ReusableCommonButton
    var identifier: String
}

class StackViewsData {

    lazy var buttonStyle = ButtonStyles()

    lazy var leftTopStackViewData: [[ButtonData]] = [
        [
            ButtonData(content: .specialSymbol("Ac"),
                       style: buttonStyle.cleanButton,
                       identifier: identifier.LeftTopIdentifiers.clearAll.rawValue),
            ButtonData(content: .sfSymbol("delete.left"),
                       style: buttonStyle.cleanButton,
                       identifier: identifier.LeftTopIdentifiers.delete.rawValue),
            ButtonData(content: .specialSymbol("/"),
                       style: buttonStyle.operatorButton,
                       identifier: identifier.LeftTopIdentifiers.divide.rawValue)
        ],
        [
            ButtonData(content: .digit("7"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.seven.rawValue),
            ButtonData(content: .digit("8"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.eight.rawValue),
            ButtonData(content: .digit("9"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.nine.rawValue)
        ],
        [
            ButtonData(content: .digit("4"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.four.rawValue),
            ButtonData(content: .digit("5"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.five.rawValue),
            ButtonData(content: .digit("6"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.six.rawValue)
        ],
        [
            ButtonData(content: .digit("1"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.one.rawValue),
            ButtonData(content: .digit("2"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.two.rawValue),
            ButtonData(content: .digit("3"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftTopIdentifiers.three.rawValue)
        ]
    ]

    lazy var rightStackViewData: [[ButtonData]] = [
        [
            ButtonData(content: .specialSymbol("*"),
                       style: buttonStyle.operatorButton,
                       identifier: identifier.RightIdentifiers.multiply.rawValue),
            ButtonData(content: .specialSymbol("-"),
                       style: buttonStyle.operatorButton,
                       identifier: identifier.RightIdentifiers.minus.rawValue),
            ButtonData(content: .specialSymbol("+"),
                       style: buttonStyle.operatorButton,
                       identifier: identifier.RightIdentifiers.plus.rawValue),
            ButtonData(content: .specialSymbol("="),
                       style: buttonStyle.equalButton,
                       identifier: identifier.RightIdentifiers.equal.rawValue)
        ]
    ]

    lazy var leftBottomStackViewData: [[ButtonData]] = [
        [
            ButtonData(content: .digit("0"),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftBottomIdentifiers.zero.rawValue),
            ButtonData(content: .specialSymbol("."),
                       style: buttonStyle.digitButton,
                       identifier: identifier.LeftBottomIdentifiers.decimalPoint.rawValue)
        ]
    ]

}
