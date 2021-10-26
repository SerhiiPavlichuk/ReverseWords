//
//  ReverseWordsUITests.swift
//  ReverseWordsUITests
//
//  Created by admin on 11.10.2021.
//

import XCTest
import ReverseWords

class ReverseWordsUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
    
        let app = XCUIApplication()
        app.launch()
        app.textFields["userInputTextField"].tap()
        app.textFields["userInputTextField"].typeText("Test string")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let reverseButton = app.buttons["Reverse"]
        reverseButton.tap()
        app.buttons["Clear"].tap()
    }
}
