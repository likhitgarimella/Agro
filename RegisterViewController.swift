//
//  RegisterViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 10/11/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI
import SVProgressHUD
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.backgroundColor = .clear
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = UIColor.black.cgColor
        
        passwordTextField.backgroundColor = .clear
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        
        button4.backgroundColor = .clear
        button4.layer.cornerRadius = 20
        button4.layer.borderWidth = 2
        button4.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    @IBAction func registerTapped(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil
            {
                print(error!)
            }
            else
            {
                print("Registration Successful!")
                
                SVProgressHUD.dismiss()
                                
                self.performSegue(withIdentifier: "goToHome", sender: self)
                
            }
        }
        
    }
    
}
