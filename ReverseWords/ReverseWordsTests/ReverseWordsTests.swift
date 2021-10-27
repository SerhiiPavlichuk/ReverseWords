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
        let inputAnotherData = "I love the smell of napalm in the morning =). bomber B-17 added heat"
        let anotherExpectedResult = "I evol eht llems fo mlapan ni eht gninrom .)= rebmob 71-B dedda taeh"
        var validateResult: String
        var anotherValidateResult: String
        
        
        // When
        validateResult = reverseString.reverseWords(input: inputData)
        anotherValidateResult = reverseString.reverseWords(input: inputAnotherData)
        
        // Then
        XCTAssertEqual(validateResult, expectedResult)
        XCTAssertEqual(anotherValidateResult, anotherExpectedResult)
    }
}
