//
//  ReverseWordsTests.swift
//  ReverseWordsTests
//
//  Created by admin on 11.10.2021.
//

import XCTest
@testable import ReverseWords

class ReverseWordsTests: XCTestCase {
    
    private let reverseString = ReverseString()
    
    func testReverseWords() throws {
        
        // Given
        let inputData = "Test string"
        let expectedResult = "tseT gnirts"
        let validateResult: String
        
        // When
        validateResult = reverseString.reverseWords(input: inputData)
        
        // Then
        XCTAssertEqual(validateResult, expectedResult)
    }
    
    func testReverseWordsWithSymbolsAndnumbers() throws {
        
        // Given
        let inputData = "I love the smell of napalm in the morning =). bomber B-17 added heat"
        let expectedResult = "I evol eht llems fo mlapan ni eht gninrom .)= rebmob 71-B dedda taeh"
        let validateResult: String
        
        // When
        validateResult = reverseString.reverseWords(input: inputData)
        
        // Then
        XCTAssertEqual(validateResult, expectedResult)
        
    }
}
