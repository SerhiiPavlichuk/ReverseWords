//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by admin on 11.10.2021.
//

import XCTest
@testable import ReverseWords

class ReverseWordsUITests: XCTestCase {

    func testStringInputAndResultCheck() throws {
    
        let app = XCUIApplication()
        let textField = app.textFields["userInputTextField"]
        let returnButton = app.buttons["Return"]
        let reverseButton = app.buttons["Reverse"]
        let resultTextView = app.textViews["reverseResult"]
        let resultText = "tseT gnirts"
        
        app.launch()
        textField.tap()
        textField.typeText("Test string")
        returnButton.tap()
        reverseButton.tap()
      
        XCTAssertEqual(resultTextView.value as! String, resultText)
    }
}
