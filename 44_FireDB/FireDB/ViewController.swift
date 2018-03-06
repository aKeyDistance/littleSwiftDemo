//
//  ViewController.swift
//  FireDB
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ViewController: UIViewController {

    
    var dbReference: DatabaseReference?
    var dbHandle: DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()

        dbReference = Database.database().reference()
        dbReference?.child("name").childByAutoId().setValue("Yash")
        dbReference?.child("name").childByAutoId().setValue("Rahul")

        
        dbHandle = dbReference?.child("name").observe(.childAdded, with: { (snapshot) in
            
            let name: String?  = snapshot.value as? String
            
            print(name as Any)
        })
    
    }

   


}

