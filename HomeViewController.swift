//
//  HomeViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 10/11/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
        
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var aadharTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    //
    
    @IBOutlet weak var map: UIButton!
    
    @IBOutlet weak var save: UIButton!
    
    @IBOutlet weak var select: UIButton!
    
    var ref:DatabaseReference!
    
    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        
        do  {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        }   catch   {
            print("Error logging out!")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.backgroundColor = .clear
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor.black.cgColor
        
        ageTextField.backgroundColor = .clear
        ageTextField.layer.cornerRadius = 20
        ageTextField.layer.borderWidth = 2
        ageTextField.layer.borderColor = UIColor.black.cgColor
        
        genderTextField.backgroundColor = .clear
        genderTextField.layer.cornerRadius = 20
        genderTextField.layer.borderWidth = 2
        genderTextField.layer.borderColor = UIColor.black.cgColor
        
        aadharTextField.backgroundColor = .clear
        aadharTextField.layer.cornerRadius = 20
        aadharTextField.layer.borderWidth = 2
        aadharTextField.layer.borderColor = UIColor.black.cgColor
        
        cityTextField.backgroundColor = .clear
        cityTextField.layer.cornerRadius = 20
        cityTextField.layer.borderWidth = 2
        cityTextField.layer.borderColor = UIColor.black.cgColor
        
        map.backgroundColor = .clear
        map.layer.cornerRadius = 10
        map.layer.borderWidth = 2
        map.layer.borderColor = UIColor.black.cgColor
        
        save.backgroundColor = .clear
        save.layer.cornerRadius = 20
        save.layer.borderWidth = 2
        save.layer.borderColor = UIColor.black.cgColor
        
        select.backgroundColor = .clear
        select.layer.cornerRadius = 20
        select.layer.borderWidth = 2
        select.layer.borderColor = UIColor.black.cgColor
        
        ref = Database.database().reference()
        
    }
    
    @IBAction func addFarmerButtonTapped(_ sender: UIButton) {
        
        if (nameTextField.text!.isEmpty || ageTextField.text!.isEmpty || genderTextField.text!.isEmpty || aadharTextField.text!.isEmpty || cityTextField.text!.isEmpty)
        
        {
            
            let myAlert = UIAlertController(title: "Alert", message: "All fields are required to fill in", preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
            
            return
            
        }
        
        nameTextField.endEditing(true)
        ageTextField.endEditing(true)
        genderTextField.endEditing(true)
        aadharTextField.endEditing(true)
        cityTextField.endEditing(true)

        nameTextField.isEnabled = false
        ageTextField.isEnabled = false
        genderTextField.isEnabled = false
        aadharTextField.isEnabled = false
        cityTextField.isEnabled = false
        
        //TODO: Send the message to Firebase and save it in our database

        let dataDB = Database.database().reference().child("Farmers")
        
        let dataDictionary = ["(1) User": Auth.auth().currentUser?.email, "(2) Name": nameTextField.text!, "(3) Age": ageTextField.text!, "(4) Gender": genderTextField.text!, "(5) Aadhar": aadharTextField.text!, "(6) City": cityTextField.text!]
        
        dataDB.child("Details").childByAutoId().setValue(dataDictionary)  //Closure
        {
            (error, reference) in
            if error != nil
            {
                print(error!)
            }
            else
            {
                print("Data Saved Successfully!")
                
                //And now we have to enable back, for a new msg
                self.nameTextField.isEnabled = true
                self.ageTextField.isEnabled = true
                self.genderTextField.isEnabled = true
                self.aadharTextField.isEnabled = true
                self.cityTextField.isEnabled = true
                
                self.nameTextField.text = ""
                self.ageTextField.text = ""
                self.genderTextField.text = ""
                self.aadharTextField.text = ""
                self.cityTextField.text = ""

            }
        }
        
//  self.ref.child("Farmers").child("Farmer1").setValue(["Name": nameTextField.text, "Age": ageTextField.text, "Gender": genderTextField.text, "Aadhar": aadharTextField.text, "City": cityTextField.text])

        
//    ref?.child("Farmers").childByAutoId().setValue(nameTextField.text)
//
//    ref?.child("Farmers").childByAutoId().setValue(ageTextField.text)
//
//    ref?.child("Farmers").childByAutoId().setValue(genderTextField.text)
//
//    ref?.child("Farmers").childByAutoId().setValue(aadharTextField.text)
//
//    ref?.child("Farmers").childByAutoId().setValue(cityTextField.text)
    
      
        let myAlert = UIAlertController(title: "Success", message: "Farmer Added", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
        return
        
    }
    
    @IBAction func selectCropsTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToCrops", sender: self)
        
    }
    
    @IBAction func mapViewTapped(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToMaps", sender: self)
        
    }
    
}
