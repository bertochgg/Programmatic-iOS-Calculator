//
//  ClearLastInputTests.swift
//  Calculator-iOSTests
//
//  Created by Humberto Garcia on 13/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest

class CalculatorClearLastInputTests: XCTestCase {
    
    var calculatorService: CalculatorServiceProtocol!
    
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
    
}
