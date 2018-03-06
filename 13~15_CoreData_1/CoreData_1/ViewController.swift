//
//  ViewController.swift
//  CoreData_1
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var user:[User]? = nil;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataHandler.cleanDelete()
        
        CoreDataHandler.saveObject(username: "Yash", password: "12345")
        CoreDataHandler.saveObject(username: "CottonCandy", password: "22-22")
        CoreDataHandler.saveObject(username: "John", password: "snow")
        CoreDataHandler.saveObject(username: "Alpha", password: "beta@")
        CoreDataHandler.saveObject(username: "yash@gmail.com", password: "neutral.ity")
        
        user = CoreDataHandler.filterData()
        
        for i in user! {
            print("Username:    \(i.username!)\n Password: \(i.password!)")
        }
        
    }

  


}

