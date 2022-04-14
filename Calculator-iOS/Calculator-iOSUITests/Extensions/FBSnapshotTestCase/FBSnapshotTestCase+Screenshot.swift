//
//  FBSnapshotTestCase+Screenshot.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//

import FBSnapshotTestCase
import XCTest

extension FBSnapshotTestCase {
    
    /// Make a screenshot for a whole app screen.
    /// - Parameters:
    ///   - app: app under test.
    ///   - identifier: screenshot identifier (file name).
    ///   - perPixelTolerance: total pixel tolerance.
    ///   - overallTolerance: the permissible deviation of each pixel.
    func verifyView(
        app: XCUIApplication,
        identifier: String,
        perPixelTolerance: CGFloat = 0.0,
        overallTolerance: CGFloat = 0.05
    ) {
        guard let screenshot = app.screenshot().image.removingStatusBar else {
            let message = "An error occurred while cropping the screenshot"
            return XCTFail(message, file: #file, line: #line)
        }
        let imageView = UIImageView(image: screenshot)
        FBSnapshotVerifyView(
            imageView,
            identifier: identifier,
            perPixelTolerance: perPixelTolerance,
            overallTolerance: overallTolerance
        )
    }
    
    /// Make a screenshot for a specific UI Element.
    /// - Parameters:
    ///   - element: element for a snapshot.
    ///   - identifier: screenshot identifier (file name).
    ///   - perPixelTolerance: total pixel tolerance.
    ///   - overallTolerance: the permissible deviation of each pixel.
    func verifyElement(
        element: XCUIElement,
        identifier: String,
        perPixelTolerance: CGFloat = 0.0,
        overallTolerance: CGFloat = 0.05
    ) {
        let imageView = UIImageView(image: element.screenshot().image)
        FBSnapshotVerifyView(
            imageView,
            identifier: identifier,
            perPixelTolerance: perPixelTolerance,
            overallTolerance: overallTolerance
        )
    }
}
