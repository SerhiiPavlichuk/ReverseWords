//
//  ReverseMethod.swift
//  ReverseWords
//
//  Created by admin on 20.10.2021.
//

import Foundation

class ReverseString {
    
    func reverseWords(input: String) -> String {
        let parts = input.components(separatedBy: Constants.Symbols.separator)
        let reversed = parts.map { String($0.reversed()) }
        return reversed.joined(separator: Constants.Symbols.separator)
    }
}
