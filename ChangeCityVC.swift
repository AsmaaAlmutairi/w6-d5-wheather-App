//
//  ChangeCityVC.swift
//  w6-d5-wheather-App
//
//  Created by ا on 11/05/1443 AH.
//  Copyright © 1443 sky. All rights reserved.
//

import UIKit

class ChangeCityVC: UIViewController {
  
    var citiesArray = [
        City(name: "الرياض", id: "108410"), 
        City(name: "الخرج", id: "109353"),
        City(name: "المدينة المنورة", id: "1699890"),
        City(name: "جدة", id: "105343"),
             City(name: "حفرالباطن", id: "106297")
    ]
   
    var selectedCity: City?
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
    }
    
    @IBAction func editCityButtonCliced(_ sender: Any) {
        if let City = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil, userInfo: ["city": City])
            self.dismiss(animated: true, completion: nil)
        }
        
    }
}
extension ChangeCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArray.count
      }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
    
      }
