//
//  ViewController.swift
//  pickerViewComponent
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class Country {
    var country:String
    var cities:[String]

    init(country:String,cities:[String]){
        self.country = country
        self.cities = cities
    }
}



class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {


    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var countries = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countries.append(Country(country:"India",cities:["Delhi","Ahmedabad","Mumbai","Pune"]))
        countries.append(Country(country:"USA",cities:["New York","DC","Fairfax"]))
        countries.append(Country(country:"Austrailia",cities:["Sydney","Melbourne"]))
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     
        if component == 0 {
            return countries.count
        } else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities.count
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return countries[row].country
        } else {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            
            return countries[selectedCountry].cities[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerView.reloadComponent(1)
        
        let selectedCountry = pickerView.selectedRow(inComponent: 0)
        let selectedCity = pickerView.selectedRow(inComponent: 1)
        
        let country = countries[selectedCountry].country
        let city = countries[selectedCountry].cities[selectedCity]
        
        countryLabel.text = " Country: \(country) \n city:\(city)"
    }
    
}

