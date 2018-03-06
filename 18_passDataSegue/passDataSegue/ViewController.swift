//
//  ViewController.swift
//  passDataSegue
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    @IBAction func continuePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "secondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? SecondViewController {
            destination.name = nameField.text
        }
        
    }

}

