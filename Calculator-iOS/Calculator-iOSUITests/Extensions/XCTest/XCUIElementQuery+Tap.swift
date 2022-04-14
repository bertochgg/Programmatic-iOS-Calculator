//
//  XCUIElementQuery+Tap.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    
    func performTap() {
        if self.element.exists {
            self.element.tap()
        } else {
            XCTFail("Unable to find element")
        }
    }
}
