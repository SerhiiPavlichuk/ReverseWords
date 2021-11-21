//
//  ExclusionRulesModeReverseViewController.swift
//  ReverseWords
//
//  Created by admin on 28.10.2021.
//

import UIKit
import Foundation

class ExclusionRulesModeReverseViewController: UIViewController {
    
    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var forExclusionTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var reversedTextView: UITextView!
    
    let sampleSentence = "Test1, I like to learn Swift 24/7"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forExclusionTextField.borderStyle = .none
        
print(reverseWords(input: sampleSentence))
}

    func reverseWords(input: String) -> String {
        
        let str = input.components(separatedBy: .decimalDigits)
        for (index, item) in input.enumerated() {
            print(index)
            print(item)
        }
        let parts = input.components(separatedBy: Constants.Symbols.separator)
        let reversed = parts.map { String($0.reversed()) }
        return reversed.joined(separator: Constants.Symbols.separator)
    }
}
