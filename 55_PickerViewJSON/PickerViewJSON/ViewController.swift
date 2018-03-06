//
//  ViewController.swift
//  PickerViewJSON
//
//  Created by Shaw on 02/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

struct Country:Decodable {
    let name :String
}


class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        
        URLSession.shared.dataTask(with: url!){ (data, response, error) in
            
            if error == nil {
                do {
                    self.countries = try JSONDecoder().decode([Country].self, from: data!)
                }catch {
                    print("Parse Error!")
                }
                
                print(self.countries.count)
                
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
                
            }
        }.resume()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let country = countries[row].name.capitalized
        
        countryLabel.text = country
        
    }



}

