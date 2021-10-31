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
    
    let sampleSentence = "a1bcd efg!h"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forExclusionTextField.borderStyle = .none
        
//        let string = "1111String to be reverse"
//
//        var ranges: [Range<String.Index>] = []
//        string.enumerateSubstrings(in: string.startIndex..., options: .byWords) { _, range, _, _ in
//            ranges.append(range)
//        }
//        var result = string
//        for range in ranges {
//            var newWord = string[range]
//            var reversed = ""
//            while !newWord.isEmpty {
//                reversed.append(newWord.removeLast())
//            }
//            result.replaceSubrange(range, with: reversed)
//        }
//        print(result)
        
        print(reverseWordsInSentence(sentence: sampleSentence))
}
    
    func reverseWordsInSentence(sentence: String) -> String {
       var sentence = sentence
       sentence.enumerateSubstrings(in: sentence.startIndex..., options: .byWords) { string, range, _, _ in

           guard let string = string, !string.allSatisfy(\.isNumber) else  {
               return
           }
           sentence.replaceSubrange(range, with: sentence[range].reversed())
       }
       return sentence
    }
}
