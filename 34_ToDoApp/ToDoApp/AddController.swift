//
//  AddController.swift
//  ToDoApp
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class AddController: UIViewController {

    
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func addPressed(_ sender: UIButton) {
        
        if ((textField.text != nil) && textField.text != "") {
            todoList?.append(textField.text!)
            
            textField.text = ""
            
            textField.placeholder = "Add more?"
        }
        
    }
    

}
