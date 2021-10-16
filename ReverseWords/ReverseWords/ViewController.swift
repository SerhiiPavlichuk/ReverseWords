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
    @IBOutlet weak var dividerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = .placeholderText
        setupUI()
        textField.addTarget(self, action: #selector(changeButtonColor), for: .allEvents)
        
    }
    
    func setupUI() {
        self.reversedStringLabel.isHidden = true
        self.reverseButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
        reverseButton.alpha = 0.7
        self.title = Constants.UI.title
        reverseButton.layer.cornerRadius = 14
        self.dividerView.backgroundColor = .placeholderText
        
        //MARK - why color does didnt changed?
//        self.navigationController?.navigationBar.tintColor = .placeholderText
       
    }
    
    var counter : Int = 0
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        counter+=1
        
        switch counter % 3 {
            
        case 1:
            
            if  let someString = textField.text {
                self.reversedStringLabel.text = reverseWords(input: someString)
                self.reversedStringLabel.isHidden = false
                self.reverseButton.setTitle(Constants.UI.buttonClearName, for: .normal)
            }
            
        case 2:
            
            if  reversedStringLabel.isEnabled == true {
                
                self.textField.text = ""
                self.reversedStringLabel.text = ""
                self.reverseButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
                self.reverseButton.alpha = 0.7
                self.dividerView.backgroundColor = .placeholderText
            }
            
        default:
            
            if  let someString = textField.text {
                self.reversedStringLabel.text = reverseWords(input: someString)
                self.reversedStringLabel.isHidden = false
                self.reverseButton.setTitle(Constants.UI.buttonClearName, for: .normal)
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
            dividerView.backgroundColor = .systemBlue
        }else{
            reverseButton.alpha = 0.7
        }
    }
}
