//
//  CalculatorOperationsUITests.swift
//  Calculator-iOSUITests
//
//  Created by Humberto Garcia on 17/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest

final class CalculatorOperationsUITests: XCTestCase {
    
    var app: XCUIApplication!
    let one = AccessibilityIdentifiers.LeftTopIdentifiers.one.name
    let two = AccessibilityIdentifiers.LeftTopIdentifiers.two.name
    let three = AccessibilityIdentifiers.LeftTopIdentifiers.three.name
    let four = AccessibilityIdentifiers.LeftTopIdentifiers.four.name
    let five = AccessibilityIdentifiers.LeftTopIdentifiers.five.name
    let six = AccessibilityIdentifiers.LeftTopIdentifiers.six.name
    let seven = AccessibilityIdentifiers.LeftTopIdentifiers.seven.name
    let eight = AccessibilityIdentifiers.LeftTopIdentifiers.eight.name
    let nine = AccessibilityIdentifiers.LeftTopIdentifiers.nine.name
    
    let zero = AccessibilityIdentifiers.LeftBottomIdentifiers.zero.name
    let decimalPoint = AccessibilityIdentifiers.LeftBottomIdentifiers.decimalPoint.name
    
    let plus = AccessibilityIdentifiers.RightIdentifiers.plus.name
    let minus = AccessibilityIdentifiers.RightIdentifiers.minus.name
    let multiply = AccessibilityIdentifiers.RightIdentifiers.multiply.name
    let divide = AccessibilityIdentifiers.LeftTopIdentifiers.divide.name
    
    let clearAll = AccessibilityIdentifiers.LeftTopIdentifiers.ac.name
    let delete = AccessibilityIdentifiers.LeftTopIdentifiers.delete.name
    let equal = AccessibilityIdentifiers.RightIdentifiers.equal.name
    
    let history = AccessibilityIdentifiers.Labels.history.rawValue
    let result = AccessibilityIdentifiers.Labels.result.rawValue

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
        app.buttons[equal].tap()
        XCTAssertEqual(app.staticTexts[history].label, expectedHistory)
        XCTAssertEqual(app.staticTexts[result].label, expectedResult)
    }
    
    // MARK: - Normal Operations
    func testAddition() {
        calculate([seven, plus, eight], "=15", "7+8")
    }

    func testSubtraction() {
        calculate([seven, minus, eight], "=-1", "7-8")
    }

    func testMultiplication() {
        calculate([seven, multiply, eight], "=56", "7*8")
    }

    func testDivision() {
        calculate([seven, divide, eight], "=0.875", "7/8")
    }

    // MARK: - Decimal Input
    func testDecimalInput() {
        calculate([seven, decimalPoint, eight], "=7.8", "7.8")
    }

    func testAdditionWithDecimalNumbers() {
        calculate([seven,
                   decimalPoint,
                   seven,
                   plus,
                   eight,
                   decimalPoint,
                   eight], "=16.5", "7.7+8.8")
    }

    func testSubtractionWithDecimalNumbers() {
        calculate([seven,
                   decimalPoint,
                   seven,
                   minus,
                   eight,
                   decimalPoint,
                   eight], "=-1.1", "7.7-8.8")
    }

    func testMultiplicationWithDecimalNumbers() {
        calculate([seven,
                   decimalPoint,
                   seven,
                   multiply,
                   eight,
                   decimalPoint,
                   eight], "=67.76", "7.7*8.8")
    }

    func testDivisionWithDecimalNumbers() {
        calculate([nine,
                   decimalPoint,
                   seven,
                   divide,
                   eight,
                   decimalPoint,
                   eight], "=1.10227", "9.7/8.8")
    }
    // MARK: - Negative numbers
    func testNegativeInput() {
        calculate([minus,
                   nine], "=-9", "-9")
    }
    
    func testNegativeOperation() {
        calculate([minus,
                   nine,
                   multiply,
                   nine], "=-81", "-9*9")
    }
    
    func testNegativeOperandsWithPositiveResult() {
        calculate([minus,
                   nine,
                   multiply,
                   minus,
                   nine], "=81", "-9*-9")
    }
    
}
