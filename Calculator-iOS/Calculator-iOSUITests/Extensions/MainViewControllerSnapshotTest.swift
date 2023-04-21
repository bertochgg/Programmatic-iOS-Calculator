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
        
        button.content = .digit("9")
        button.buttonTapped()
        calculator.handleDigit("9")
        assertSnapshot(matching: calculator, as: .image, record: true)
    }

}
