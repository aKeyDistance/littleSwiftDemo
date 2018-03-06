//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Shaw on 04/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

struct Currency: Decodable{
   let  base: String
   let  date:String
   let  rates:[String:Double]
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    
    var currencyData:Currency?
    var basicRate = 1.0
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        tableview.delegate = self
        tableview.dataSource = self
        
    }


    @IBAction func convertPressed(_ sender: UIButton) {
        
       if  let stringValue = textField.text {
            
            if let  value = Double(stringValue){
                basicRate = value
                tableview.reloadData()
            }
        }
        
    }
    
    func fetchData(){
        
        let url = URL(string: "https://api.fixer.io/latest?base=INR")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do {
                    self.currencyData = try JSONDecoder().decode(Currency.self, from: data!)
                }catch {
                    print("parse Error!")
                }
                
                DispatchQueue.main.async {
                    print(self.currencyData?.date)
                    
                    self.tableview.reloadData()
                    
                }
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currencyData != nil {
            return currencyData!.rates.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        
        if let currencyFetched = currencyData {
            cell.textLabel?.text = Array(currencyFetched.rates.keys)[indexPath.row]
            
            let selectedItemValue = Array(currencyFetched.rates.values)[indexPath.row];
            cell.detailTextLabel?.text = "\(Double(selectedItemValue) * basicRate)"
            return cell
        }
        return UITableViewCell()
    }
    
    
}

