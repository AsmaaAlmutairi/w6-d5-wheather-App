//
//  ViewController.swift
//  w6-d5-wheather-App
//
//  Created by ا on 08/05/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var TempLebal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["id":"108410" , "appid":"8ee19edc5ed1c786108f6ba97979d7d4"]
        
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters : params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.result.value {
                          let JSON = result as! NSDictionary
                          print(JSON)
                      }
        }
        
    }


}

