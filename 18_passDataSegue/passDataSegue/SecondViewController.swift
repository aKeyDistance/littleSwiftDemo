//
//  SecondViewController.swift
//  passDataSegue
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var name:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let nameToDisplay = name {
            displayLabel.text = nameToDisplay
        }
    
    }

  

}
