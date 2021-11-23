//
//  AuthViewController.swift
//  ReverseWords
//
//  Created by admin on 20.11.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AuthViewController: UIViewController {
    
    var signUp: Bool = true{
        willSet{
            if newValue{
                titleLable.text = "Registration"
                nameField.isHidden = false
                enterButton.setTitle("SignIn", for: .normal)
            }else{
                titleLable.text = "SignIn"
                nameField.isHidden = true
                enterButton.setTitle("Registration", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }
    @IBAction func switchLogIn(_ sender: Any) {
        signUp = !signUp
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true,  completion: nil)
    }
    
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if(signUp) {
            if (!name.isEmpty && !email.isEmpty && !password.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        if let result = result{
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            }else{
                showAlert()
            }
        }else{
            
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }else{
                showAlert()
            }
        }
        return true
    }
}
