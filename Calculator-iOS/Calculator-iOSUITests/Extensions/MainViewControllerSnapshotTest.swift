//
//  MainViewControllerSnapshotTest.swift
//  Calculator-iOSUITests
//
//  Created by Humberto Garcia on 20/04/23.
//  Copyright © 2023 Grid Dynamics. All rights reserved.
//
@testable import Calculator_iOS_Dev
import XCTest
import SnapshotTesting

final class MainViewControllerSnapshotTest: XCTestCase {
    
    var sut: MainViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MainViewController()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testMainCalculatorUIOnIphoneEight() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhone8), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneEightDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhone8), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneX() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneX), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneXDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneX), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneEightPlus() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhone8Plus), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneEightPlusDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneX), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneSE() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneSe), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneSEDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneSe), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneXR() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneXr), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneXRDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneXr), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneXSMax() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneXsMax), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIphoneXSMaxDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPhoneXsMax), record: false)
        XCTAssertNil(result)
    }
    
    // MARK: - iPad
    func testMainCalculatorUIOnIpadMini() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadMini), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadMiniDarMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadMini), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro10() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro10_5), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro10DarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro10_5), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro11() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro11), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro11DarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro11), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro12() {
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro12_9), record: false)
        XCTAssertNil(result)
    }
    
    func testMainCalculatorUIOnIpadPro12DarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let result = verifySnapshot(matching: sut, as: .image(on: .iPadPro12_9), record: false)
        XCTAssertNil(result)
    }

    func testAdditionButton() {
        let button = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 96))
        button.setupButton(with: ButtonStyles().operatorButton, content: .specialSymbol("+"))
        assertSnapshot(matching: button, as: .image, record: false)
    }
    
    func testAdditionButtonDarkMode() {
        sut.view.overrideUserInterfaceStyle = .dark
        let button = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 96))
        button.setupButton(with: ButtonStyles().operatorButton, content: .specialSymbol("+"))
        assertSnapshot(matching: button, as: .image, record: false)
    }
    
    func testNumberPad() {
        let button = CalculatorButton(frame: CGRect(x: 0, y: 0, width: 62, height: 62))
        button.setupButton(with: ButtonStyles().digitButton, content: .digit("5"))
        assertSnapshot(matching: button, as: .image, record: false)
    }

}
