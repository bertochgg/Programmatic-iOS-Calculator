//
//  MultiplicationTestsCases.swift
//  Calculator-iOSTests
//
//  Created by Humberto Garcia on 13/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest

class CalculatorServiceOperationsTests: XCTestCase {
    
    var calculatorService: CalculatorServiceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorService = CalculatorService()
    }
    
    override func tearDownWithError() throws {
        calculatorService = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Addition Operation Cases
    func testAdditionOperation() {
        // Given
        calculatorService.setOperationsHistory("5+2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 7)
    }
    
    // MARK: - Subtraction Operation Cases
    func testSubtractionOperation() {
        // Given
        calculatorService.setOperationsHistory("5-2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 3)
    }
    
    func testSubtractionOperationWithNegativeNumbers() {
        // Given
        calculatorService.setOperationsHistory("-2-4")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), -6)
    }
    
    func testSubtractionOperationWithDecimalNumbers() {
        // Given
        calculatorService.setOperationsHistory("4.5-2.5")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 2)
    }
    
    // MARK: - Multiplication Operation Cases
    func testMultiplicationOperation() {
        // Given
        calculatorService.setOperationsHistory("5*2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 10)
    }
    
    func testMultiplicationOperationWithNegativeNumbers() {
        // Given
        calculatorService.setOperationsHistory("-2*-4")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 8)
    }
    
    func testMultiplicationOperationWithDecimalNumbers() {
        // Given
        calculatorService.setOperationsHistory("2.5*3.5")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 8.75)
    }
    
    // MARK: - Division Operation Cases
    func testDivisionOperation() {
        // Given
        calculatorService.setOperationsHistory("6/2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 3)
    }
    
    func testDivisionOperationWithNegativeNumbers() {
        // Given
        calculatorService.setOperationsHistory("-6/-2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 3)
    }
    
    func testDivisionOperationWithDecimalNumbers() {
        // Given
        calculatorService.setOperationsHistory("2.5/0.5")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 5)
    }
    
}
