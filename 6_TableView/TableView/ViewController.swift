//
//  ViewController.swift
//  TableView
//
//  Created by Shaw on 26/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var companyTableView: UITableView!
    
    let companyname = ["Apple","Alphabet","Amazon"]
    let share = [99.99,87.89,12.34]
     
    override func viewDidLoad() {
        super.viewDidLoad()

        companyTableView.delegate = self
        companyTableView.dataSource = self
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companyname.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = companyTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = companyname[indexPath.row]
        cell?.detailTextLabel?.text = "\(share[indexPath.row])"
        
        return cell!
        
    }
    
    
}

