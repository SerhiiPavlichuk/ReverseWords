//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ReverseViewController: UIViewController {
    
    // MARK: - Enums
    
    enum ScreenState {
        case blank
        case reverse
        case clear(reversedText: String)
    }
    
    private enum Action {
        case textChanged
        case buttonPressed
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var userInputTextField: UITextField! {
        didSet {
            userInputTextField.addTarget(self, action: #selector(onTextFieldEdited), for: .editingChanged)
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
            reverseAndClearButton.layer.cornerRadius = CGFloat(Constants.UI.reverseAndClearButtonCornerRadius)
        }
    }
    @IBOutlet weak var dividerView: UIView! {
        didSet {
            dividerView.backgroundColor = .placeholderText
        }
    }
    
    // MARK: - Property
    
    private var reverseMethod = ReverseMethod()
    private var screenState: ScreenState = .blank {
        didSet {
            setupUI()
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        reverseAndClearButton.setTitleColor(.white, for: .disabled)
        title = Constants.UI.title
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        
        func setupBlankState() {
            
            reverseAndClearButton.isEnabled = false
            reverseAndClearButton.alpha = Constants.ButtonActions.disabledButtonAlpha
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reversedTextView.isHidden = true
            reversedTextView.text?.removeAll()
            dividerView.backgroundColor = .placeholderText
            userInputTextField.text?.removeAll()
        }
        
        func setupEnterTextState() {
            
            reverseAndClearButton.isEnabled = true
            reverseAndClearButton.alpha = CGFloat(Constants.ButtonActions.enabledButtonAlpha)
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reversedTextView.isHidden = true
            reversedTextView.text?.removeAll()
            dividerView.backgroundColor = .systemBlue
        }
        
        func setupClearState(withText: String) {
            
            reverseAndClearButton.isEnabled = true
            reverseAndClearButton.alpha = CGFloat(Constants.ButtonActions.enabledButtonAlpha)
            reverseAndClearButton.setTitle(Constants.ButtonActions.buttonClearName, for: .normal)
            reversedTextView.isHidden = false
            reversedTextView.text = withText
            dividerView.backgroundColor = .placeholderText
        }
        
        switch screenState {
        case .blank:
            setupBlankState()
        case .reverse:
            setupEnterTextState()
        case .clear(let reversedText):
            setupClearState(withText: reversedText)
        }
    }
    
    @objc private func onTextFieldEdited() {
        
        determineNextState(afterAction: .textChanged)
    }
    
    private func determineNextState(afterAction action: Action) {
        
        var resultState: ScreenState?
        
        func determineNextStateAfterTextChanged() {
            
            switch screenState {
            case .blank:
                if userInputTextField.text?.isNotEmpty ?? false {
                    resultState = .reverse
                } else {
                    resultState = nil
                }
            case .reverse:
                if userInputTextField.text?.isEmpty ?? true {
                    resultState = .blank
                }
            case .clear:
                break
            }
        }
        
        func determineNextStateAfterButtonPressed() {
            
            switch screenState {
            case .blank:
                break
            case .reverse:
                if let value = userInputTextField.text,
                   !value.isEmpty {
                    let resultText = reverseMethod.reverseWords(input: value)
                    resultState = .clear(reversedText: resultText)
                } else {
                    break
                }
            case .clear:
                resultState = .blank
            }
        }
        
        switch action {
        case .textChanged:
            determineNextStateAfterTextChanged()
        case .buttonPressed:
            determineNextStateAfterButtonPressed()
        }
        
        if let value = resultState {
            screenState = value
        }
    }
    
    //MARK: - Action
    
    @IBAction func reverseAndClearButtonPressed(_ sender: UIButton) {
        
        determineNextState(afterAction: .buttonPressed)
    }
}

//MARK: - Extension

extension String {
    var isNotEmpty: Bool { return !isEmpty }
}
