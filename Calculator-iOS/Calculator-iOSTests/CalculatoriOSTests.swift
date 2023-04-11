//
//  CalculatoriOSTests.swift
//  Calculator-iOSTests
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import XCTest
@testable import Calculator_iOS_Dev

class CalculatorServiceTests: XCTestCase {

    var calculatorService: CalculatorService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorService = CalculatorService()
    }

    override func tearDownWithError() throws {
        calculatorService = nil
        try super.tearDownWithError()
    }
    
    // MARK: - ClearLastInput Cases
    func testClearLastInput() {
        // Given
        calculatorService.setOperationsHistory("2+2")

        // When
        calculatorService.clearLastInput()

        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2+")
    }
    
    func testClearLastInputWithDecimals() {
        // Given
        calculatorService.setOperationsHistory("2.2")

        // When
        calculatorService.clearLastInput()

        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2.")
    }
    
    func testClearLastInputWithOperators() {
        // Given
        calculatorService.setOperationsHistory("2/5")

        // When
        calculatorService.clearLastInput()

        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2/")
    }
    
    func testClearLastInputWithOperatorsAndMissingDecimalNumber() {
        // Given
        calculatorService.setOperationsHistory("2.2/2.2")

        // When
        calculatorService.clearLastInput()

        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2.2/2.")
    }
    
    // MARK: - Setter and Getter for LastResult Cases
    func testSetAndGetLastResult() {
        // Given
        let expectedResult: Double = 5.5

        // When
        calculatorService.setLastResult(expectedResult)
        let result = calculatorService.getLastResult()

        // Then
        XCTAssertEqual(result, expectedResult)
    }

    // MARK: - Setter and Getter for OperationsHistory Cases
    func testSetAndGetOperationsHistory() {
        // Given
        let expectedHistory = "2.2+2.2"

        // When
        calculatorService.setOperationsHistory(expectedHistory)
        let result = calculatorService.getOperationsHistory()

        // Then
        XCTAssertEqual(result, expectedHistory)
    }

    // MARK: - UpdateResult Cases
    func testUpdateResult() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2")

        // When
        calculatorService.updateResult()

        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 4)
    }

}
