//
//  ViewController.swift
//  ReverseWords
//
//  Created by admin on 11.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reversedTextView: UITextView!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var dividerView: UIView!
    
    var counter : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUI()
        textField.addTarget(self, action: #selector(buttonState), for: .allEvents)
        textField.addTarget(self, action: #selector(dividerState), for: .allEvents)
    }
    
    
    //MARK: - Methods
    
    func setupUI() {
        
        if textField.text == "" {
            self.reverseButton.isEnabled = false
            self.reverseButton.setTitleColor(.white, for: .disabled)
            self.reverseButton.backgroundColor = .systemBlue
            self.reverseButton.alpha = 0.6
            self.textField.font = UIFont(name: Constants.UI.font, size: 17)
        }
        
        self.reversedTextView.isHidden = true
        self.reverseButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
        self.title = Constants.UI.title
        self.reverseButton.layer.cornerRadius = 14
        self.dividerView.backgroundColor = .placeholderText
        self.reversedTextView.font = UIFont(name: Constants.UI.font, size: 22)
        self.reversedTextView.textColor = .systemBlue
        self.textField.font = UIFont(name: Constants.UI.font, size: 17)
        self.reversedTextView.isEditable = false
        
        //MARK - why color does didnt changed?
        //        self.navigationController?.navigationBar.tintColor = .placeholderText
        
    }
    
    @objc func buttonState() {
        
        if textField.text == "" {
            self.reverseButton.isEnabled = false
            self.reverseButton.setTitleColor(.white, for: .disabled)
            self.reverseButton.alpha = 0.6
            self.reversedTextView.isHidden = true
            
        }else{
            
            self.reverseButton.isEnabled = true
            self.reverseButton.alpha = 1
            
        }
    }
    
    @objc func dividerState() {

          if textField.text == "" {

              self.dividerView.backgroundColor = .placeholderText

          }else{
              self.dividerView.backgroundColor = .systemBlue

          }
      }
    
    
    func reverseWords(input: String) -> String {
        let parts = input.components(separatedBy: " ")
        let reversed = parts.map { String($0.reversed()) }
        return reversed.joined(separator: " ")
        
    }
    
    //MARK: - Action
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        counter+=1
        
        switch counter % 2 {
            
        case 1:
            
            if  reversedTextView.isHidden == false {
                
                self.textField.text = ""
                self.reversedTextView.text = ""
                self.reverseButton.setTitle(Constants.UI.buttonReverseName, for: .normal)
                self.reverseButton.isEnabled = false
                self.dividerView.backgroundColor = .placeholderText
                self.reverseButton.alpha = 0.6
            }
            
        default:
            
            if  let someString = textField.text {
                self.reversedTextView.text = reverseWords(input: someString)
                self.reversedTextView.isHidden = false
                self.reverseButton.setTitle(Constants.UI.buttonClearName, for: .normal)
            }
        }
    }
}
