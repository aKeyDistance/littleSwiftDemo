//
//  ViewController.swift
//  TableViewCellAction
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var countries = [Country]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let canada = Country(name: "canada", capital: "ottawa")
        let southKorea = Country(name: "southKorea", capital: "seoul")
        let japan = Country(name: "japan", capital: "tokyo")
        let china = Country(name: "china", capital: "beijing")
        let unitedStates = Country(name: "unitedStates", capital: "washington")
        let unitedKingdom = Country(name: "unitedKingdom", capital: "london")

        countries.append(canada)
        countries.append(southKorea)
        countries.append(japan)
        countries.append(china)
        countries.append(unitedStates)
        countries.append(unitedKingdom)

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell")
        
        cell?.textLabel?.text = countries[indexPath.row].name.capitalized
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CountryViewController {
            
             destination.country = countries[(tableView.indexPathForSelectedRow?.row)!]
        }
        
    }
    
}

