//
//  WeatherViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 14/12/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "a3a75400f4a64d79bc2c6d60fad5185c"
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self //We are setting the weather view controller as the delegate of the location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //The accuracy of the location data
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

    }
    
    //MARK: - Networking
    /***************************************************************/
    



    //Write the getWeatherData method here:
    func getWeatherData(url: String, parameters: [String : String])
    {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON
            {
                response in
                if response.result.isSuccess
                {
                    print("Success! Weather data obtained")
                    
                    let weatherJSON : JSON = JSON(response.result.value!)   //Converting to JSON format since .value has 'Any' format
                    print(weatherJSON)
                    self.updateWeatherData(json: weatherJSON)
                }
                
                else
                {
                    print("Error \(String(describing: response.result.error))")
                    self.cityLabel.text = "No Connection"
                }
        }
    }
    
    //MARK: - JSON Parsing
     /***************************************************************/
    
     
     //Write the updateWeatherData method here:
     func updateWeatherData(json: JSON)
     {
         if let tempResult = json["main"]["temp"].double {   //Navigating to json -> main -> temp    //Take a look at the compiler for json
         
         weatherDataModel.temperatute = Int(tempResult - 273.15)    //Force unwrapping so as to get a double and thereby converting to Int
                                                                 //Instead of force unwrapping, by putting 'if let', we are Optional Binding
         weatherDataModel.city = json["name"].stringValue
         
         weatherDataModel.condition = json["weather"][0]["id"].intValue
         
         weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
             
         updateUIWithWeatherData()   //We need to call this function to get the data the data updateUIWithWeatherData function below
             
         }
         
         else
         {
             cityLabel.text = "Weather Unavailable"
         }
     }
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    func updateUIWithWeatherData()
    {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.temperatute)°"  //"\()" means converting to string
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:     //To receive the msg of updated location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //We get a bunch of locations from CLLocation, first we get a rough location, then thereby we get a precise one
        //The last element in the CLLocation array is the precise one
        let location = locations[locations.count - 1]
        
        if location.horizontalAccuracy > 0  //To check the radius of GPS location circle is postive and not negative or invalid
        {
            locationManager.stopUpdatingLocation()
            
            print("Longitude = \(location.coordinate.longitude), Latitude = \(location.coordinate.latitude)")
            //Now run the app, set Simulator's location to Apple in Simulator -> Debug -> Location
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)   //Converting coordinates values to strings
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude,  "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
            
        }
    }
    
    //Write the didFailWithError method here:   //Tells the delegate that the location manager was unable to retrieve a location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func userEnteredANewCityname(city: String)
    {
        print(city)
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    @IBAction func getCropsByWeather(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "getCropsByWeather", sender: self)
        
    }
    
    
    //Write the PrepareForSegue Method here
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName"
        {
            let destinationVC = segue.destination as! ChangeCityViewController
            
            destinationVC.delegate = self
        }
    }

}
