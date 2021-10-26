//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by admin on 11.10.2021.
//

import XCTest
@testable import ReverseWords

class ReverseWordsTests: XCTestCase {
    
    var reverseString = ReverseString()
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testReverseWords() throws {
        
        // Given
        let userTextField = "Test string"
        let expectedResult = "tseT gnirts"
        var validateResult = ""
        
        // When
        validateResult = reverseString.reverseWords(input: userTextField)
        
        // Then
        XCTAssertEqual(validateResult, expectedResult)
    }
}
