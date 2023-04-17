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
    
    //    func testExample() throws {
    //        let app = XCUIApplication()
    //        app.launch()
    //        XCTAssert(true, "The true test")
    //    }
    //
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
    //            measure(metrics: [XCTApplicationLaunchMetric()]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
    
    func testCalculatorButtons() {
        app.buttons["main-screen.clearAll.button"].tap()
        app.buttons["main-screen.delete.button"]
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
    func testAddition() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=15")
    }
    
    func testSubtraction() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=-1")
    }
    
    func testMultiplication() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=56")
    }
    
    func testDivision() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=0.875")
    }
    
    // MARK: - Decimal Input
    func testDecimalInput() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=7.8")
    }
    
    func testAdditionWithDecimalNumbers() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=16.5")
    }
    
    func testSubtractionWithDecimalNumbers() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=-1.1")
    }
    
    func testMultiplicationWithDecimalNumbers() {
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=67.76")
    }
    
    func testDivisionWithDecimalNumbers() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=1.10227")
    }
    
    // MARK: - Negative numbers
    func testNegativeInput() {
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=-9")
    }
    
    func testNegativeOperation() {
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=-81")
    }
    
    func testNegativeOperandsWithPositiveResult() {
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=81")
    }
    
    // MARK: - AC Button
    func testACToClearOperationsHistoryLabel() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.clearAll.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "0")
    }
    
    func testACToClearLabelsAfterGettingOperationResult() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        app.buttons["main-screen.clearAll.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "0")
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "0.0")
    }
    
    // MARK: - Logical Errors
    func testDivisionByZero() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.zero.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=+∞")
    }
    
    func testNegativeDivisionByZero() {
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.zero.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=-∞")
    }
    
    func testIfUserCanEnterDoubleDecimalPoints() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.3")
    }
    
    func testInvalidInput() {
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9")
    }
    
    // MARK: - Large Operations
    func testLargeOperations() {
        app.buttons["main-screen.one.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.two.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.four.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.six.button"].tap()
        app.buttons["main-screen.minus.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.eight.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.six.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=33.37778")
    }
    
    // MARK: - Delete Button
    func testDeleteLastInput() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "93")
    }
    
    func testDeleteButtonUntilTheEndAndProveZeroAppears() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "0")
    }
    
    func testDeleteButtonUntilTheEndAndCheckArrayIsNotOverflowed() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.plus.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "0")
    }
    
    func testDeleteButtonResetsDecimalFlagWhenDecimalPointIsDeleted() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenOperatorIsDeleted() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.3")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenNumberNearDecimalIsDeleted() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.delete.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.3")
    }
    
    // MARK: - Decimal Flag
    func testDecimalFlagWhenInputTwoDecimalNumbers() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.divide.button"].tap()
        app.buttons["main-screen.two.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.nine.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.3/2.9")
    }
    
    // MARK: - Keep Entering input after result has been given
    func testEnterInputAfterEqualHasBeenTapped() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.history.label"].label, "9.3*5.3*7")
    }
    
    func testEnterInputAfterEqualHasBeenTappedAndGetResult() {
        app.buttons["main-screen.nine.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.five.button"].tap()
        app.buttons["main-screen.decimalPoint.button"].tap()
        app.buttons["main-screen.three.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        app.buttons["main-screen.multiply.button"].tap()
        app.buttons["main-screen.seven.button"].tap()
        app.buttons["main-screen.equal.button"].tap()
        
        XCTAssertEqual(app.staticTexts["main-screen.result.label"].label, "=345.03")
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
