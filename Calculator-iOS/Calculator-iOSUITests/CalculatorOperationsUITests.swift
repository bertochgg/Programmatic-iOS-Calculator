//
//  CalculatorOperationsUITests.swift
//  Calculator-iOSUITests
//
//  Created by Humberto Garcia on 17/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest

typealias identifier = AccessibilityIdentifiers

final class CalculatorOperationsUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    // MARK: - Normal Operations
    // Helper function to perform calculations
    func calculate(_ buttons: [String], _ expectedResult: String, _ expectedHistory: String) {
        for button in buttons {
            app.buttons[button].tap()
        }
        app.buttons[identifier.RightIdentifiers.equal.rawValue].tap()
        XCTAssertEqual(app.staticTexts[identifier.LabelIdentifiers.history.rawValue].label, expectedHistory)
        XCTAssertEqual(app.staticTexts[identifier.LabelIdentifiers.result.rawValue].label, expectedResult)
    }
    
    // MARK: - Normal Operations
    func testAddition() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=15", "7+8")
    }

    func testSubtraction() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=-1", "7-8")
    }

    func testMultiplication() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=56", "7*8")
    }

    func testDivision() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=0.875", "7/8")
    }

    // MARK: - Decimal Input
    func testDecimalInput() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=7.8", "7.8")
    }

    func testAdditionWithDecimalNumbers() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=16.5", "7.7+8.8")
    }

    func testSubtractionWithDecimalNumbers() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=-1.1", "7.7-8.8")
    }

    func testMultiplicationWithDecimalNumbers() {
        calculate([identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=67.76", "7.7*8.8")
    }

    func testDivisionWithDecimalNumbers() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue], "=1.10227", "9.7/8.8")
    }
    // MARK: - Negative numbers
    func testNegativeInput() {
        calculate([identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue], "=-9", "-9")
    }
    
    func testNegativeOperation() {
        calculate([identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue], "=-81", "-9*9")
    }
    
    func testNegativeOperandsWithPositiveResult() {
        calculate([identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue], "=81", "-9*-9")
    }
    
}
