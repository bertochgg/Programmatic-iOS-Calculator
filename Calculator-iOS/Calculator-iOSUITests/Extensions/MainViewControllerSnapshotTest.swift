//
//  MainViewControllerSnapshotTest.swift
//  Calculator-iOSUITests
//
//  Created by Humberto Garcia on 20/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest
import SnapshotTesting

final class MainViewControllerSnapshotTest: XCTestCase {
    
    func testExample() {
        let calculator = MainViewController()
        assertSnapshot(matching: calculator, as: .image)
    }
    
    func testAddition() {
        
        let calculator = MainViewController()
        let button = CalculatorButton()
        
        button.setupButton(with: ButtonStyles().digitButton, content: .digit("1"))
        calculator.view.addSubview(button)
        
        button.delegate?.didChangeOutput(digit: "1")
        button.delegate?.didChangeOutput(digit: "+")
        button.delegate?.didChangeOutput(digit: "2")
        button.delegate?.didChangeOutput(digit: "=")
        assertSnapshot(matching: calculator, as: .image, record: false)
        
    }

}
