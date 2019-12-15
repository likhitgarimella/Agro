//
//  ChangeCityViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 14/12/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit

//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityname(city: String)
}

class ChangeCityViewController: UIViewController {
    
    //Declare the delegate variable here:
    var delegate : ChangeCityDelegate?
    
    @IBOutlet weak var changeCityTextField: UITextField!
    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    
    @IBAction func getWeatherPressed(_ sender: UIButton) {
        
        //1 Get the city name the user entered in the text field
        let cityName = changeCityTextField.text!
        
        //2 If we have a delegate set, call the method userEnteredANewCityName
        delegate?.userEnteredANewCityname(city: cityName)   //Using a ? is called Optional Chaining
                                                            //Checks whether that delegate has a value or is it nil
        //If it contains a value, then function after '?' is executed; if it is nil, then ignore it entirely
        
        
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
}
