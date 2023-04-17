//
//  CalculatoriOSUITests.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest

final class CalculatoriOSUITests: XCTestCase {
    
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
    
    func testCalculatorButtons() {
        app.buttons[clearAll].tap()
        app.buttons[delete].tap()
        app.buttons[divide].tap()
        app.buttons[multiply].tap()
        app.buttons[seven].tap()
        app.buttons[eight].tap()
        app.buttons[nine].tap()
        app.buttons[minus].tap()
        app.buttons[four].tap()
        app.buttons[five].tap()
        app.buttons[six].tap()
        app.buttons[plus].tap()
        app.buttons[one].tap()
        app.buttons[two].tap()
        app.buttons[three].tap()
        app.buttons[zero].tap()
        app.buttons[decimalPoint].tap()
        app.buttons[equal].tap()
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
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

    // MARK: - AC Button
    func testACToClearOperationsHistoryLabel() {
        calculate([nine, clearAll], "0.0", "0")
    }
    
    func testACToClearLabelsAfterGettingOperationResult() {
        calculate([nine,
                   multiply,
                   five,
                   equal,
                   clearAll], "0.0", "0")
    }
    
    // MARK: - Logical Errors
    func testDivisionByZero() {
        calculate([nine,
                   divide,
                   zero], "=+∞", "9/0")
    }
    
    func testNegativeDivisionByZero() {
        calculate([minus,
                   nine,
                   divide,
                   zero], "=-∞", "-9/0")
    }
    
    func testIfUserCanEnterDoubleDecimalPoints() {
        calculate([nine,
                   decimalPoint,
                   three,
                   decimalPoint], "=9.3", "9.3")
    }
    
    func testInvalidInput() {
        calculate([plus,
                   multiply,
                   nine], "=9", "9")
    }
    
    // MARK: - Large Operations
    func testLargeOperations() {
        calculate([one, plus, two,
                   minus, three, multiply,
                   four, divide, five,
                   plus, six, minus,
                   seven, multiply, eight,
                   divide, nine, plus,
                   five, multiply, six,
                   plus, three], "=33.37778", "1+2-3*4/5+6-7*8/9+5*6+3")
    }
    
    // MARK: - Delete Button
    func testDeleteLastInput() {
        calculate([nine,
                   three,
                   plus,
                   delete], "=93", "93")
    }
    
    func testDeleteButtonUntilTheEndAndProveZeroAppears() {
        calculate([nine,
                   three,
                   plus,
                   delete,
                   delete,
                   delete], "0", "0")
    }
    
    func testDeleteButtonUntilTheEndAndCheckArrayIsNotOverflowed() {
        calculate([nine,
                   three,
                   plus,
                   delete,
                   delete,
                   delete,
                   delete,
                   delete,
                   delete,
                   delete,
                   delete], "0", "0")
    }
    
    func testDeleteButtonResetsDecimalFlagWhenDecimalPointIsDeleted() {
        calculate([nine,
                   decimalPoint,
                   three,
                   delete,
                   delete,
                   decimalPoint], "=0", "9.")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenOperatorIsDeleted() {
        calculate([nine,
                   decimalPoint,
                   three,
                   divide,
                   three,
                   decimalPoint,
                   three,
                   delete,
                   delete,
                   delete,
                   delete,
                   decimalPoint], "=9.3", "9.3")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenNumberNearDecimalIsDeleted() {
        calculate([nine,
                   decimalPoint,
                   three,
                   delete,
                   three,
                   decimalPoint], "=9.3", "9.3")
    }
    
    // MARK: - Decimal Flag
    func testDecimalFlagWhenInputTwoDecimalNumbers() {
        calculate([nine,
                   decimalPoint,
                   three,
                   divide,
                   two,
                   decimalPoint,
                   nine], "=3.2069", "9.3/2.9")
    }
    
    // MARK: - Keep Entering input after result has been given
    func testEnterInputAfterEqualHasBeenTapped() {
        calculate([nine,
                   decimalPoint,
                   three,
                   multiply,
                   five,
                   decimalPoint,
                   three,
                   equal,
                   multiply,
                   seven], "=345.03", "9.3*5.3*7")
    }
    
    func testEnterInputAfterEqualHasBeenTappedAndGetResult() {
        calculate([nine,
                   decimalPoint,
                   three,
                   multiply,
                   five,
                   decimalPoint,
                   three,
                   equal,
                   multiply,
                   seven], "=345.03", "9.3*5.3*7")
    }
    
    // MARK: - Alerts
    func testAlertForInvalidOperationWithOperatorForLastChar() {
        app.buttons[nine].tap()
        app.buttons[divide].tap()
        app.buttons[equal].tap()
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    func testAlertForInvalidOperationWithDecimalPointForLastChar() {
        app.buttons[nine].tap()
        app.buttons[decimalPoint].tap()
        app.buttons[equal].tap()
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
}
