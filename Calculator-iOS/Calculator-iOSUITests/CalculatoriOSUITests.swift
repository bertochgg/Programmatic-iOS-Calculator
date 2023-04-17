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
        app.buttons["Ac"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["delete.left"]/*[[".buttons[\"backspace\"]",".buttons[\"delete.left\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["/"].tap()
        app.buttons["*"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["-"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["0"].tap()
        app.buttons["."].tap()
        app.buttons["="].tap()
        app.alerts["Error"].scrollViews.otherElements.buttons["Ok"].tap()
    }
    
    // MARK: - Normal Operations
    func testAddition() {
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=15"].label, "=15")
    }
    
    func testSubtraction() {
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=-1"].label, "=-1")
    }
    
    func testMultiplication() {
        app.buttons["7"].tap()
        app.buttons["*"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=56"].label, "=56")
    }
    
    func testDivision() {
        app.buttons["7"].tap()
        app.buttons["/"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=0.875"].label, "=0.875")
    }
    
    // MARK: - Decimal Input
    func testDecimalInput() {
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=7.8"].label, "=7.8")
    }
    
    func testAdditionWithDecimalNumbers() {
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["7"].tap()
        app.buttons["+"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=16.5"].label, "=16.5")
    }
    
    func testSubtractionWithDecimalNumbers() {
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["7"].tap()
        app.buttons["-"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=-1.1"].label, "=-1.1")
    }
    
    func testMultiplicationWithDecimalNumbers() {
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["7"].tap()
        app.buttons["*"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=67.76"].label, "=67.76")
    }
    
    func testDivisionWithDecimalNumbers() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["7"].tap()
        app.buttons["/"].tap()
        app.buttons["8"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=1.10227"].label, "=1.10227")
    }
    
    // MARK: - Negative numbers
    func testNegativeInput() {
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=-9"].label, "=-9")
    }
    
    func testNegativeOperation() {
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=-81"].label, "=-81")
    }
    
    func testNegativeOperandsWithPositiveResult() {
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["=81"].label, "=81")
    }
    
    // MARK: - AC Button
    func testACToClearOperationsHistoryLabel() {
        app.buttons["9"].tap()
        app.buttons["Ac"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "0")
    }
    
    func testACToClearLabelsAfterGettingOperationResult() {
        app.buttons["9"].tap()
        app.buttons["*"].tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
        app.buttons["Ac"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "0")
        XCTAssertEqual(app.staticTexts["result"].label, "0.0")
    }
    
    // MARK: - Logical Errors
    func testDivisionByZero() {
        app.buttons["9"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["result"].label, "=+∞")
    }
    
    func testNegativeDivisionByZero() {
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["result"].label, "=-∞")
    }
    
    func testIfUserCanEnterDoubleDecimalPoints() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.3")
    }
    
    func testInvalidInput() {
        app.buttons["+"].tap()
        app.buttons["*"].tap()
        app.buttons["9"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9")
    }
    
    // MARK: - Large Operations
    func testLargeOperations() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        app.buttons["4"].tap()
        app.buttons["/"].tap()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["6"].tap()
        app.buttons["-"].tap()
        app.buttons["7"].tap()
        app.buttons["*"].tap()
        app.buttons["8"].tap()
        app.buttons["/"].tap()
        app.buttons["9"].tap()
        app.buttons["+"].tap()
        app.buttons["5"].tap()
        app.buttons["*"].tap()
        app.buttons["6"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["result"].label, "=33.37778")
    }
    
    // MARK: - Delete Button
    func testDeleteLastInput() {
        app.buttons["9"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["delete.left"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "93")
    }
    
    func testDeleteButtonUntilTheEndAndProveZeroAppears() {
        app.buttons["9"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "0")
    }
    
    func testDeleteButtonUntilTheEndAndCheckArrayIsNotOverflowed() {
        app.buttons["9"].tap()
        app.buttons["3"].tap()
        app.buttons["+"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "0")
    }
    
    func testDeleteButtonResetsDecimalFlagWhenDecimalPointIsDeleted() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["."].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenOperatorIsDeleted() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["/"].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["."].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.3")
    }
    
    func testDeleteButtonDoesNotResetsDecimalFlagWhenNumberNearDecimalIsDeleted() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["delete.left"].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.3")
    }
    
    // MARK: - Decimal Flag
    func testDecimalFlagWhenInputTwoDecimalNumbers() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["/"].tap()
        app.buttons["2"].tap()
        app.buttons["."].tap()
        app.buttons["9"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.3/2.9")
    }
    
    // MARK: - Keep Entering input after result has been given
    func testEnterInputAfterEqualHasBeenTapped() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        app.buttons["5"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        app.buttons["*"].tap()
        app.buttons["7"].tap()
        
        XCTAssertEqual(app.staticTexts["history"].label, "9.3*5.3*7")
    }
    
    func testEnterInputAfterEqualHasBeenTappedAndGetResult() {
        app.buttons["9"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        app.buttons["5"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        app.buttons["*"].tap()
        app.buttons["7"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["result"].label, "=345.03")
    }
}
