//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInputTextField: UITextField!{
        didSet{
            userInputTextField.addTarget(self, action: #selector(buttonState), for: .allEvents)
            userInputTextField.addTarget(self, action: #selector(dividerState), for: .allEvents)
        }
    }
    @IBOutlet weak var reversedTextView: UITextView!
    @IBOutlet weak var reverseAndClearButton: UIButton!
    @IBOutlet weak var dividerView: UIView!
    
    var buttonPressCounter : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Methods
    
    func setupUI() {
        
        if userInputTextField.text?.isEmpty ?? true {
            reverseAndClearButton.isEnabled = false
            reverseAndClearButton.setTitleColor(.white, for: .disabled)
            reverseAndClearButton.backgroundColor = .systemBlue
            reverseAndClearButton.alpha = Constants.UI.reverseAndClearButtonIsDisabled
            userInputTextField.font = Constants.UI.userInputTextFieldFont
        }
        
        reversedTextView.isHidden = true
        reverseAndClearButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
        title = Constants.UI.title
        reverseAndClearButton.layer.cornerRadius = CGFloat(Constants.UI.reverseAndClearButtonCornerRadius)
        dividerView.backgroundColor = .placeholderText
        reversedTextView.font = Constants.UI.reversedTextViewFont
        reversedTextView.textColor = .systemBlue
        userInputTextField.font = Constants.UI.userInputTextFieldFont
        reversedTextView.isEditable = false
    }
    
    @objc func buttonState() {
        
        if userInputTextField.text?.isEmpty ?? true {
            reverseAndClearButton.isEnabled = false
            reverseAndClearButton.setTitleColor(.white, for: .disabled)
            reverseAndClearButton.alpha = Constants.UI.reverseAndClearButtonIsDisabled
            reversedTextView.isHidden = true
        } else {
            reverseAndClearButton.isEnabled = true
            reverseAndClearButton.alpha = CGFloat(Constants.UI.reverseAndClearButtonIsEnabled)
        }
    }
    
    @objc func dividerState() {
        
        if userInputTextField.text?.isEmpty ?? true {
            dividerView.backgroundColor = .placeholderText
        } else {
            dividerView.backgroundColor = .systemBlue
        }
    }
    
    
    func reverseWords(input: String) -> String {
        let parts = input.components(separatedBy: Constants.Symbols.whiteSpace)
        let reversed = parts.map { String($0.reversed()) }
        return reversed.joined(separator: Constants.Symbols.whiteSpace)
    }
    
    //MARK: - Action
    
    @IBAction func reverseAndClearButtonPressed(_ sender: UIButton) {
        
        buttonPressCounter += 1
        
        if buttonPressCounter % 2 == 1 {
            userInputTextField.text?.removeAll()
            reversedTextView.text?.removeAll()
            reverseAndClearButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
            reverseAndClearButton.isEnabled = false
            dividerView.backgroundColor = .placeholderText
            reverseAndClearButton.alpha = Constants.UI.reverseAndClearButtonIsDisabled
        } else {
            guard let someString = userInputTextField.text  else { return }
                reversedTextView.text = reverseWords(input: someString)
                reversedTextView.isHidden = false
                reverseAndClearButton.setTitle(Constants.UI.buttonClearName, for: .normal)
            }
        }
    }



