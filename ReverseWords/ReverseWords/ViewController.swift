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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.addTarget(self, action: #selector(reverseButtonPressed), for: .editingDidEnd)
       
    }
    
    
    @IBAction func reverseButtonPressed(_ sender: Any) {
        
        reverse(textField.text!)
        
    }
    
    func reverse (_ string:String) -> Void {
        var temp = ""
        for index in (0..<string.count).reversed(){
            let character = string[String.Index(utf16Offset: index, in: string)]
            temp += String(character)
        }
        reversedStringLabel.text = temp
    }
}




