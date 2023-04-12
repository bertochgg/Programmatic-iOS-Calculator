//
//  NSExpressionExtensionTests.swift
//  Calculator-iOSTests
//
//  Created by Humberto Garcia on 12/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import XCTest
@testable import Calculator_iOS_Dev

class NSExpressionExtensionTests: XCTestCase {
    
    var nsExpressionExtension: NSExpression!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        nsExpressionExtension = NSExpression()
    }
    
    override func tearDownWithError() throws {
        nsExpressionExtension = nil
        try super.tearDownWithError()
    }
    
    func testToFloatingPointDivision_functionWithDivisionByConstantValue() {
        // Given
        let inputExpression = NSExpression(forFunction: "divide:by:", arguments: [NSExpression(forConstantValue: 2)])
        
        // When
        let outputExpression = inputExpression.toFloatingPointDivision()
        
        // Then
        XCTAssertEqual(outputExpression.expressionType, .function)
        XCTAssertEqual(outputExpression.function, "divide:by:")
        XCTAssertEqual(outputExpression.arguments?.count, 1)
        XCTAssertEqual(outputExpression.arguments?.first?.expressionType, .constantValue)
        XCTAssertEqual(outputExpression.arguments?.first?.constantValue as? Double, 2.0)
    }

}
