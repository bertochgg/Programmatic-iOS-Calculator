//
//  NSExpressionExtension.swift
//  Calculator-iOS
//
//  Created by Humberto Garcia on 04/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//

import Foundation

extension NSExpression {
    var floatifiedForDivisionIfNeeded: NSExpression {
        if function == "divide:by:", let args = arguments, let last = args.last,
          let firstValue = args.first?.constantValue as? NSNumber {
            let newFirst = NSExpression(forConstantValue: firstValue.doubleValue)
            return NSExpression(forFunction: function, arguments: [newFirst, last])
        } else {
            return self
        }
    }
}
