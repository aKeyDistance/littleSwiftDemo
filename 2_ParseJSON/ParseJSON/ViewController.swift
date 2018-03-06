//
//  ViewController.swift
//  ParseJSON
//
//  Created by Shaw on 08/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit


struct Country : Decodable  {

    let name : String
    let capital : String
    let region : String
}

class ViewController: UIViewController {

    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURL = "https://restcountries.eu/rest/v2/all"
        let url = URL(string:jsonURL)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data!)
                
                for eachCountry in self.countries {
                    print(eachCountry.name + "  :"  + eachCountry.capital)
                }
            }
            catch {
                print("error")
            }
        }.resume()
        
        
        
    }

  

}

