//
//  CalculatoriOSUITests.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//
import XCTest

final class CalculatoriOSUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testCalculatorButtons() {
        app.buttons["main-screen.clearAll.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.four.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.six.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.one.button"].tap()
        app.buttons["main-screen.two.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.zero.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    // MARK: - Normal Operations
    // Helper function to perform calculations
    func calculate(_ buttons: [String], _ expectedResult: String, _ expectedHistory: String) {
        for button in buttons {
            app.buttons[button].tap()
        }
        app.buttons["main-screen.equal.button"].tap()
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, expectedHistory)
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, expectedResult)
    }

    // MARK: - Normal Operations
    func testAddition() {
        calculate(["main-screen.seven.button", "main-screen.plus.button", "main-screen.eight.button"], "=15", "7+8")
    }

    func testSubtraction() {
        calculate(["main-screen.seven.button", "main-screen.minus.button", "main-screen.eight.button"], "=-1", "7-8")
    }

    func testMultiplication() {
        calculate(["main-screen.seven.button", "main-screen.multiply.button", "main-screen.eight.button"], "=56", "7*8")
    }

    func testDivision() {
        calculate(["main-screen.seven.button", "main-screen.divide.button", "main-screen.eight.button"], "=0.875", "7/8")
    }

    // MARK: - Decimal Input
    func testDecimalInput() {
        calculate(["main-screen.seven.button", "main-screen.decimalPoint.button", "main-screen.eight.button"], "=7.8", "7.8")
    }

    func testAdditionWithDecimalNumbers() {
        calculate(["main-screen.seven.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.seven.button",
                   "main-screen.plus.button",
                   "main-screen.eight.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.eight.button"], "=16.5", "7.7+8.8")
    }

    func testSubtractionWithDecimalNumbers() {
        calculate(["main-screen.seven.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.seven.button",
                   "main-screen.minus.button",
                   "main-screen.eight.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.eight.button"], "=-1.1", "7.7-8.8")
    }

    func testMultiplicationWithDecimalNumbers() {
        calculate(["main-screen.seven.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.seven.button",
                   "main-screen.multiply.button",
                   "main-screen.eight.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.eight.button"], "=67.76", "7.7*8.8")
    }

    func testDivisionWithDecimalNumbers() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.seven.button",
                   "main-screen.divide.button",
                   "main-screen.eight.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.eight.button"], "=1.10227", "9.7/8.8")
    }
    // MARK: - Negative numbers
    func testNegativeInput() {
        calculate(["main-screen.minus.button",
                   "main-screen.nine.button",
                   "main-screen.equal.button"], "=-9", "-9")
    }
    
    func testNegativeOperation() {
        calculate(["main-screen.minus.button",
                   "main-screen.nine.button",
                   "main-screen.multiply.button",
                   "main-screen.nine.button",
                   "main-screen.equal.button"], "=-81", "-9*9")
    }
    
    func testNegativeOperandsWithPositiveResult() {
        calculate(["main-screen.minus.button",
                   "main-screen.nine.button",
                   "main-screen.multiply.button",
                   "main-screen.minus.button",
                   "main-screen.nine.button",
                   "main-screen.equal.button"], "=81", "-9*-9")
    }
    
    // MARK: - AC Button
    func testACToClearOperationsHistoryLabel() {
        calculate(["main-screen.nine.button", "main-screen.clearAll.button"], "0.0", "0")
    }
    
    func testACToClearLabelsAfterGettingOperationResult() {
        calculate(["main-screen.nine.button",
                   "main-screen.multiply.button",
                   "main-screen.five.button",
                   "main-screen.equal.button",
                   "main-screen.clearAll.button"], "0.0", "0")
    }
    
    // MARK: - Logical Errors
    func testDivisionByZero() {
        calculate(["main-screen.nine.button",
                   "main-screen.divide.button",
                   "main-screen.zero.button",
                   "main-screen.equal.button"], "=+∞", "9/0")
    }
    
    func testNegativeDivisionByZero() {
        calculate(["main-screen.minus.button",
                   "main-screen.nine.button",
                   "main-screen.divide.button",
                   "main-screen.zero.button",
                   "main-screen.equal.button"], "=-∞", "-9/0")
    }
    
    func testIfUserCanEnterDoubleDecimalPoints() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.decimalPoint.button"], "0", "9.3")
    }
    
    func testInvalidInput() {
        calculate(["main-screen.plus.button",
                   "main-screen.multiply.button",
                   "main-screen.nine.button"], "0", "9")
    }
    
    // MARK: - Large Operations
    func testLargeOperations() {
        calculate(["main-screen.one.button", "main-screen.plus.button", "main-screen.two.button",
                   "main-screen.minus.button", "main-screen.three.button", "main-screen.multiply.button",
                   "main-screen.four.button", "main-screen.divide.button", "main-screen.five.button",
                   "main-screen.plus.button", "main-screen.six.button", "main-screen.minus.button",
                   "main-screen.seven.button", "main-screen.multiply.button", "main-screen.eight.button",
                   "main-screen.divide.button", "main-screen.nine.button", "main-screen.plus.button",
                   "main-screen.five.button", "main-screen.multiply.button", "main-screen.six.button",
                   "main-screen.plus.button", "main-screen.three.button",
                   "main-screen.equal.button"], "=33.37778", "1+2-3*4/5+6-7*8/9+5*6+3")
    }
    
    // MARK: - Delete Button
    func testDeleteLastInput() {
        calculate(["main-screen.nine.button",
                   "main-screen.three.button",
                   "main-screen.plus.button",
                   "main-screen.delete.button"], "=93", "93")
    }
    
    func testDeleteButtonUntilTheEndAndProveZeroAppears() {
        calculate(["main-screen.nine.button",
                   "main-screen.three.button",
                   "main-screen.plus.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button"], "0", "0")
    }
    
    func testDeleteButtonUntilTheEndAndCheckArrayIsNotOverflowed() {
        calculate(["main-screen.nine.button",
                   "main-screen.three.button",
                   "main-screen.plus.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button"], "0", "0")
    }
    
    func testDeleteButtonResetsDecimalFlagWhenDecimalPointIsDeleted() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.decimalPoint.button"], "=0", "9.")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenOperatorIsDeleted() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.divide.button",
                   "main-screen.three.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.delete.button",
                   "main-screen.decimalPoint.button"], "=9.3", "9.3")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenNumberNearDecimalIsDeleted() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.delete.button",
                   "main-screen.three.button",
                   "main-screen.decimalPoint.button"], "=9.3", "9.3")
    }
    
    // MARK: - Decimal Flag
    func testDecimalFlagWhenInputTwoDecimalNumbers() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.divide.button",
                   "main-screen.two.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.nine.button"], "=3.2069", "9.3/2.9")
    }
    
    // MARK: - Keep Entering input after result has been given
    func testEnterInputAfterEqualHasBeenTapped() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.multiply.button",
                   "main-screen.five.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.equal.button",
                   "main-screen.multiply.button",
                   "main-screen.seven.button"], "=345.03", "9.3*5.3*7")
    }
    
    func testEnterInputAfterEqualHasBeenTappedAndGetResult() {
        calculate(["main-screen.nine.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.multiply.button",
                   "main-screen.five.button",
                   "main-screen.decimalPoint.button",
                   "main-screen.three.button",
                   "main-screen.equal.button",
                   "main-screen.multiply.button",
                   "main-screen.seven.button",
                   "main-screen.equal.button"], "=345.03", "9.3*5.3*7")
    }
    
    // MARK: - Alerts
    func testAlertForInvalidOperationWithOperatorForLastChar() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testAlertForInvalidOperationWithDecimalPointForLastChar() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
}
