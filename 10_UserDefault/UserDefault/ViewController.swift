//
//  ViewController.swift
//  UserDefault
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textName: UITextField!
    
    @IBOutlet weak var labelName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.value(forKey: "name") as? String {
            labelName.text = name
        }
        
        textName.delegate = self
    
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 1 {
            labelName.text = textField.text
            
            UserDefaults.standard.set(textField.text!, forKey: "name")
        }
        
        return true
    }
    
    
    
     
    
}

