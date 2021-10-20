//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ReverseViewController: UIViewController {
    
    // MARK: - Enum
    
    enum ScreenState {
        case blank
        case reverse
        case clear(reversedText: String)
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var userInputTextField: UITextField! {
        didSet {
            userInputTextField.addTarget(self, action: #selector(buttonState), for: .editingChanged)
            userInputTextField.addTarget(self, action: #selector(dividerState), for: .editingChanged)
            userInputTextField.font = Constants.Font.userInputTextFieldFont
            userInputTextField.font = Constants.Font.userInputTextFieldFont
        }
    }
    @IBOutlet weak var reversedTextView: UITextView! {
        didSet {
            reversedTextView.font = Constants.Font.reversedTextViewFont
            reversedTextView.textColor = .systemBlue
            reversedTextView.isEditable = false
            reversedTextView.isHidden = true
        }
    }
    @IBOutlet weak var reverseAndClearButton: UIButton! {
        didSet {
            reverseAndClearButton.isEnabled = false
            reverseAndClearButton.setTitleColor(.white, for: .disabled)
            reverseAndClearButton.backgroundColor = .systemBlue
            reverseAndClearButton.alpha = Constants.ButtonActions.disabledButtonAlpha
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reverseAndClearButton.layer.cornerRadius = CGFloat(Constants.UI.reverseAndClearButtonCornerRadius)
        }
    }
    @IBOutlet weak var dividerView: UIView! {
        didSet {
            dividerView.backgroundColor = .placeholderText
        }
    }
    
    // MARK: - Property
    
    private var reverseMethod: ReverseMethod = ReverseMethod()
    private var buttonPressCounter: Int = 1
    private var screenState: ScreenState = .blank {
        didSet {
            setupUI()
        }
    }
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupUI()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        
        func setupBlankState() {
            
            title = Constants.UI.title
            reverseAndClearButton.isEnabled = false
            reverseAndClearButton.setTitleColor(.white, for: .disabled)
            reverseAndClearButton.alpha = Constants.ButtonActions.disabledButtonAlpha
            reversedTextView.isHidden = true
            dividerView.backgroundColor = .placeholderText
        }
        
        func setupReverseState() {
    
            reverseAndClearButton.isEnabled = true
            reverseAndClearButton.alpha = CGFloat(Constants.ButtonActions.enabledButtonAlpha)
            dividerView.backgroundColor = .systemBlue
        }
        
        func setupClearState(withText: String) {
            
            userInputTextField.text?.removeAll()
            reversedTextView.text?.removeAll()
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reverseAndClearButton.isEnabled = false
            dividerView.backgroundColor = .placeholderText
            reverseAndClearButton.alpha = Constants.ButtonActions.disabledButtonAlpha
        }
        
        switch screenState {
        case .blank:
            setupBlankState()
        case .reverse:
            setupReverseState()
        case .clear(let reversedText):
            setupClearState(withText: reversedText)
        }
    }
    
    @objc private func buttonState() {
        
        if userInputTextField.text?.isEmpty ?? true {
            screenState = .blank
        } else {
            screenState = .reverse
        }
    }
    
    @objc private func dividerState() {
        
        if userInputTextField.text?.isEmpty ?? true {
            screenState = .blank
        } else {
            screenState = .reverse
        }
    }
    
    //MARK: - Action
    
    @IBAction private func reverseAndClearButtonPressed(_ sender: UIButton) {
        
        buttonPressCounter += 1
        
        if buttonPressCounter % 2 == 1 {
            guard let someText = reversedTextView.text else { return }
            screenState = .clear(reversedText: someText)
//            userInputTextField.text?.removeAll()
//            reversedTextView.text?.removeAll()
//            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
//            reverseAndClearButton.isEnabled = false
//            dividerView.backgroundColor = .placeholderText
//            reverseAndClearButton.alpha = Constants.ButtonActions.disabledButtonAlpha
        } else {
            guard let someString = userInputTextField.text  else { return }
            reversedTextView.text = reverseMethod.reverseWords(input: someString)
            reversedTextView.isHidden = false
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonClearName, for: .normal)
        }
    }
}
