//
//  XCTestCase+Screenshot.swift
//  Calculator-iOSUITests
//
//  Created by Serhii Liamtsev on 4/9/22.
//  Copyright © 2022 Grid Dynamics. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func takeScreenshot(name: String) {
      let fullScreenshot = XCUIScreen.main.screenshot()

      let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
      screenshot.lifetime = .keepAlways
      add(screenshot)
    }
}
