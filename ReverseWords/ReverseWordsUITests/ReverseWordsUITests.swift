//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by admin on 11.10.2021.
//

import XCTest
@testable import ReverseWords

class ReverseWordsUITests: XCTestCase {
    
    enum AppError: Error {
        case wrongResultViewValueType
    }
    
    func testStringInputAndResultCheck() throws {
        
        let app = XCUIApplication()
        let textField = app.textFields["userInputTextField"]
        let returnButton = app.buttons["Return"]
        let reverseButton = app.buttons["Reverse"]
        let resultTextView = app.textViews["reverseResult"]
        let expectedResultText = "tseT gnirts"
        
        app.launch()
        textField.tap()
        textField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
        
        if let value = resultTextView.value as? String {
            XCTAssertEqual(value, expectedResultText)
        } else {
            throw AppError.wrongResultViewValueType
        }
    }
}
