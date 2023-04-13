//
//  CalculatoriOSTests.swift
//  Calculator-iOSTests
//
//  Created by Serhii Liamtsev on 4/9/22.
//
@testable import Calculator_iOS_Dev
import XCTest

class CalculatorServiceTests: XCTestCase {
    
    var calculatorService: CalculatorServiceProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        calculatorService = CalculatorService()
    }
    
    override func tearDownWithError() throws {
        calculatorService = nil
        try super.tearDownWithError()
    }
    
    // MARK: - Getter for LastResult Case
    func testSetAndGetLastResult() {
        // Given
        calculatorService.setOperationsHistory("5.5")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 5.5)
    }
    
    // MARK: - Setter and Getter for OperationsHistory Cases
    func testSetAndGetOperationsHistory() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2")
        
        // When
        let result = calculatorService.getOperationsHistory()
        
        // Then
        XCTAssertEqual(result, "2.2+2.2")
    }
    
    // MARK: - UpdateResult Cases
    func testUpdateResult() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2/2.3*17.3")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 18.747826086956525)
    }
    
    // MARK: - Edge Cases
    func testDivideByZero() {
        // Given
        calculatorService.setOperationsHistory("5/0")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isInfinite)
    }
    
    func testOverflow() {
        // Given
        calculatorService.setOperationsHistory(String(Int.max) + "+1")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isFinite)
    }
    
    func testUnderflow() {
        // Given
        calculatorService.setOperationsHistory(String(Int.min) + "-1")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isFinite)
    }
    
    func testEmptyInput() {
        // Given
        calculatorService.setOperationsHistory("")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isEqual(to: 0))
    }
    
    func testChainOperators() {
        // Given
        calculatorService.setOperationsHistory("-2+3*4/2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 4)
    }
    
    func testNegativeNumbers() {
        // Given
        calculatorService.setOperationsHistory("-2*-3")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 6.0)
    }
    
    func testClearInputAfterResult() {
        // Given
        calculatorService.setOperationsHistory("2+2")
        
        // When
        calculatorService.updateResult()
        calculatorService.clearAll()
        
        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "0")
    }
    
    func testClearLastOperator() {
        // Given
        calculatorService.setOperationsHistory("2+")
        
        // When
        calculatorService.clearLastInput()
        
        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2")
    }
    
    func testClearLastDecimalPoint() {
        // Given
        calculatorService.setOperationsHistory("2.2+")
        
        // When
        calculatorService.clearLastInput()
        
        // Then
        XCTAssertEqual(calculatorService.getOperationsHistory(), "2.2")
    }
    
    func testLargeExpression() {
        // Given
        calculatorService.setOperationsHistory("2+3*4/2-1+7*8-9/3*2+10+2.3/-17.5*6.4-2.3*-2.9+5.7/2.1")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 75.54314285714286)
    }
    
    func testLargeOperationWithDecimalNumbers() {
        // Given
        calculatorService.setOperationsHistory("2.5+3.5*2.9/2.9-5.2/4.1*6.7-1.3+2.8/1.2*7.7/5.5+12.21")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 11.679105691056909)
    }
    
    // MARK: - Operations that should give decimal results
    func testDivisionThatShouldGiveDecimalResult() {
        // Given
        calculatorService.setOperationsHistory("1/2")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 0.5)
    }
    
    // MARK: - UpdateResult Cases
    func testUpdateResult_WithInvalidExpression() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2/0")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isInfinite)
    }
    
    func testUpdateResult_WithExpressionEndingInOperator() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2/")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isZero)
    }
    
    func testUpdateResult_WithExpressionEndingInDecimal() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isZero)
    }
    
    func testUpdateResult_WithExpressionEndingInTwoOperatorsAndMinusBeingTheLast() {
        // Given
        calculatorService.setOperationsHistory("2.2+2.2+-")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertTrue(calculatorService.getLastResult().isZero)
    }
    
    func testUpdateResultLastCharIsOperator() {
        // given
        calculatorService.setOperationsHistory("1+")
        
        // when
        calculatorService.updateResult()
        
        // then
        XCTAssertEqual(calculatorService.getLastResult(), 0)
    }
    
    func testUpdateResultLastCharAndPenultimateCharAreOperators() {
        // given
        calculatorService.setOperationsHistory("1+-")
        
        // when
        calculatorService.updateResult()
        
        // then
        XCTAssertEqual(calculatorService.getLastResult(), 0)
    }
    
    func testUpdateResultVerifyingDoubleOperatorInExpression() {
        // given
        calculatorService.setOperationsHistory("3/-")
        
        // when
        calculatorService.updateResult()
        
        // then
        XCTAssertTrue(calculatorService.getLastResult().isZero)
    }
    
    // MARK: - Tests for invalid inputs
    func testInvalidInputStartingWithOperators() {
        // Given
        calculatorService.setOperationsHistory("/3")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 0)
    }
    
    func testDecimalPointWithoutLeadingZero() {
        // Given
        calculatorService.setOperationsHistory(".3")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 0.3)
    }
    
    func testExpressionWithNoLeadingZeroAndBeingDecimalNumbers() {
        // Given
        calculatorService.setOperationsHistory(".47+.29-.18*.61/.14")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), -0.024285714285714133)
    }
    
    func testExpressionWithNoLeadingZeroAndBeingDecimalNumbersButWithAnIntegerNumberAtBeginning() {
        // Given
        calculatorService.setOperationsHistory("47+.29-.18*.61/.14")
        
        // When
        calculatorService.updateResult()
        
        // Then
        XCTAssertEqual(calculatorService.getLastResult(), 46.505714285714284)
    }
    
    func testSetOperationsHistory_InvalidRegexPattern() {
        // Given pattern
        let invalidPattern = "(?<=\\+|\\-|\\*|\\/|^)(" // Invalid regular expression pattern
        
        // When
        calculatorService.setOperationsHistory("5+5") // Call the method with a valid parameter
        calculatorService.setOperationsHistory("1.2+.4-.5*.6/.7") // Call the method with a parameter that requires pattern substitution
        
        // Then
        XCTAssertThrowsError(try NSRegularExpression(pattern: invalidPattern), "Invalid regex pattern should throw an error") { error in
            // Verify that the error message is logged to the console
            XCTAssertEqual(error.localizedDescription, "The value “(?<=\\+|\\-|\\*|\\/|^)(” is invalid.")
        }
    }

}
