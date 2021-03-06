//
//  ViewController.swift
//  w6-d5-wheather-App
//
//  Created by ا on 08/05/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController {
    @IBOutlet weak var tempLebal: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil)
        
        let params = ["id":"108410" , "appid":"8ee19edc5ed1c786108f6ba97979d7d4"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters : params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
            let JSONDictionary = result as! NSDictionary
                let main = JSONDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                let pressure = main["pressure"] as! Double
                 let humidity = main["humidity"] as! Double
                
                
                
                temp = temp - 272.15
                temp = Double(round(1000 * temp)/1000)
                
                self.tempLebal.text = "\(temp)°"
                self.pressureLabel.text = "\(pressure)°"
                self.humidityLabel.text = "\(humidity)°"
                
            }
        }
        
    }
   /*
     Kharj => 109353
     Medina => 1699890
     Jeddah => 105343
     Hafar Al-Batin => 106297
     */
    
    
    
    
    @objc func cityChanged(notification: Notification){
        if let city = notification.userInfo?["city"] as? City {
            cityNameLabel.text = city.name
            
        }
        
    }


}

