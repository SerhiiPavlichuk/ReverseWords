//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reversedStringLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reversedStringLabel.isHidden = true
        self.reverseButton.setTitle("Reverse", for: .normal)
        reverseButton.alpha = 0.7
        textField.addTarget(self, action: #selector(changeButtonColor), for: .allEvents)
    }
    
    var counter : Int = 0
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        counter+=1
        
        switch counter % 3 {
        case 1:
            if  let someString = textField.text {
                self.reversedStringLabel.text = reverseWords(input: someString)
                self.reversedStringLabel.isHidden = false
                self.reverseButton.setTitle("Clear", for: .normal)
            }
        case 2:
            if  reversedStringLabel.isEnabled == true {
                
                self.textField.text = ""
                self.reversedStringLabel.text = ""
                self.reverseButton.setTitle("Reverse", for: .normal)
            }
        default:
            if  let someString = textField.text {
                self.reversedStringLabel.text = reverseWords(input: someString)
                self.reversedStringLabel.isHidden = false
                self.reverseButton.setTitle("Clear", for: .normal)
            }
        }
    }
    
    func reverseWords(input: String) -> String {
        let parts = input.components(separatedBy: " ")
        let reversed = parts.enumerated().map { $0 % 2 == 0 ? String($1.reversed()) : $1 }
        return reversed.joined(separator: " ")
    }
    
    @objc private func changeButtonColor() {
        if textField.hasText{
            reverseButton.alpha = 1
        }else{
            reverseButton.alpha = 0.7
        }
    }
}
