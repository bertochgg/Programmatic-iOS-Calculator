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
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app = nil
    }
    
    func testCalculatorButtonsExist() {
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.clearAll.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.delete.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.divide.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.RightIdentifiers.multiply.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.seven.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.eight.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.nine.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.RightIdentifiers.minus.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.four.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.five.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.six.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.RightIdentifiers.plus.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.one.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.two.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftTopIdentifiers.three.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftBottomIdentifiers.zero.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.LeftBottomIdentifiers.decimalPoint.rawValue].exists)
        XCTAssertTrue(app.buttons[identifier.RightIdentifiers.equal.rawValue].exists)
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

    // MARK: - AC Button
    func testACToClearOperationsHistoryLabel() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue, identifier.LeftTopIdentifiers.clearAll.rawValue], "0.0", "0")
    }
    
    func testACToClearLabelsAfterGettingOperationResult() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.five.rawValue,
                   identifier.RightIdentifiers.equal.rawValue,
                   identifier.LeftTopIdentifiers.clearAll.rawValue], "0.0", "0")
    }
    
    // MARK: - Logical Errors
    func testDivisionByZero() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftBottomIdentifiers.zero.rawValue], "=+∞", "9/0")
    }
    
    func testNegativeDivisionByZero() {
        calculate([identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftBottomIdentifiers.zero.rawValue], "=-∞", "-9/0")
    }
    
    func testIfUserCanEnterDoubleDecimalPoints() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue], "=9.3", "9.3")
    }
    
    func testInvalidInput() {
        calculate([identifier.RightIdentifiers.plus.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue], "=9", "9")
    }
    
    // MARK: - Large Operations
    func testLargeOperations() {
        calculate([identifier.LeftTopIdentifiers.one.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.two.rawValue,
                   identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.four.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.five.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.six.rawValue,
                   identifier.RightIdentifiers.minus.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.eight.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.five.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.six.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue], "=33.37778", "1+2-3*4/5+6-7*8/9+5*6+3")
    }
    
    // MARK: - Delete Button
    func testDeleteLastInput() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue], "=93", "93")
    }
    
    func testDeleteButtonUntilTheEndAndProveZeroAppears() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue], "0", "0")
    }
    
    func testDeleteButtonUntilTheEndAndCheckArrayIsNotOverflowed() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.plus.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue], "0", "0")
    }
    
    func testDeleteButtonResetsDecimalFlagWhenDecimalPointIsDeleted() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue], "=0", "9.")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenOperatorIsDeleted() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue], "=9.3", "9.3")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenNumberNearDecimalIsDeleted() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftTopIdentifiers.delete.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue], "=9.3", "9.3")
    }
    
    // MARK: - Decimal Flag
    func testDecimalFlagWhenInputTwoDecimalNumbers() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.LeftTopIdentifiers.divide.rawValue,
                   identifier.LeftTopIdentifiers.two.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.nine.rawValue], "=3.2069", "9.3/2.9")
    }
    
    // MARK: - Keep Entering input after result has been given
    func testEnterInputAfterEqualHasBeenTapped() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.five.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.equal.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue], "=345.03", "9.3*5.3*7")
    }
    
    func testEnterInputAfterEqualHasBeenTappedAndGetResult() {
        calculate([identifier.LeftTopIdentifiers.nine.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.five.rawValue,
                   identifier.LeftBottomIdentifiers.decimalPoint.rawValue,
                   identifier.LeftTopIdentifiers.three.rawValue,
                   identifier.RightIdentifiers.equal.rawValue,
                   identifier.RightIdentifiers.multiply.rawValue,
                   identifier.LeftTopIdentifiers.seven.rawValue], "=345.03", "9.3*5.3*7")
    }
    
    // MARK: - Alerts
    func testAlertForInvalidOperationWithOperatorForLastChar() {
        app.buttons[identifier.LeftTopIdentifiers.nine.rawValue].tap()
        app.buttons[identifier.LeftTopIdentifiers.divide.rawValue].tap()
        app.buttons[identifier.RightIdentifiers.equal.rawValue].tap()
        
        XCTAssertNotNil(app.alerts.element)
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssertFalse(app.alerts.element.exists, "The alert still exists on the screen.")
    }
    
    func testAlertForInvalidOperationWithDecimalPointForLastChar() {
        app.buttons[identifier.LeftTopIdentifiers.nine.rawValue].tap()
        app.buttons[identifier.LeftBottomIdentifiers.decimalPoint.rawValue].tap()
        app.buttons[identifier.RightIdentifiers.equal.rawValue].tap()
        
        XCTAssertTrue(app.alerts.element.exists)
        
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
        
        XCTAssertFalse(app.alerts.element.exists, "The alert still exists on the screen.")
    }
    
}
