//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ReverseViewController: UIViewController {
    
    // MARK: - Enums
    
    private enum ScreenState {
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
        }
    }
    @IBOutlet weak var actionButton: UIButton! {
        didSet {
            actionButton.setTitleColor(.white, for: .disabled)
            actionButton.backgroundColor = .systemBlue
            actionButton.layer.cornerRadius = Constants.UI.reverseAndClearButtonCornerRadius
        }
    }
    @IBOutlet weak var dividerView: UIView!
    
    // MARK: - Properties
    
    private let reverseMethod = ReverseString()
    private var screenState: ScreenState = .blank {
        didSet {
            setupUI()
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        title = Constants.UI.title
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        
        func setupBlankState() {
            
            actionButton.isEnabled = false
            actionButton.alpha = Constants.ButtonActions.disabledButtonAlpha
            actionButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reversedTextView.isHidden = true
            reversedTextView.text?.removeAll()
            dividerView.backgroundColor = .placeholderText
            userInputTextField.text?.removeAll()
        }
        
        func setupEnterTextState() {
            
            actionButton.isEnabled = true
            actionButton.alpha = CGFloat(Constants.ButtonActions.enabledButtonAlpha)
            actionButton.setTitle(Constants.ButtonActions.buttonReverseName, for: .normal)
            reversedTextView.isHidden = true
            reversedTextView.text?.removeAll()
            dividerView.backgroundColor = .systemBlue
        }
        
        func setupClearState(withText: String) {
            
            actionButton.isEnabled = true
            actionButton.alpha = CGFloat(Constants.ButtonActions.enabledButtonAlpha)
            actionButton.setTitle(Constants.ButtonActions.buttonClearName, for: .normal)
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
                   value.isNotEmpty {
                    let resultText = reverseMethod.reverseWords(input: value)
                    resultState = .clear(reversedText: resultText)
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
    
    // MARK: - Action
    
    @IBAction func reverseAndClearButtonPressed(_ sender: UIButton) {
        
        determineNextState(afterAction: .buttonPressed)
    }
}
