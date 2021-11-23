//
//  ModeChoiseViewController.swift
//  ReverseWords
//
//  Created by admin on 21.11.2021.
//

import Foundation
import UIKit
import Firebase

class ModeChoiseViewController: UIViewController{
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLogOutButtonUI()
        
    }
    func setupLogOutButtonUI() {
        let logOutButton = UIBarButtonItem(title: "LogOut", style: .done, target: self, action: #selector(logOutAction))
        self.navigationItem.leftBarButtonItem = logOutButton
    }
    @IBAction func logOutAction(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
