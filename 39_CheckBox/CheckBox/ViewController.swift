//
//  ViewController.swift
//  CheckBox
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BEMCheckBoxDelegate {

    
    @IBOutlet weak var buyCow: BEMCheckBox!
    
    @IBOutlet weak var buyCar: BEMCheckBox!
    
    @IBOutlet weak var buyCycle: BEMCheckBox!
    
    @IBOutlet weak var buyBread: BEMCheckBox!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyCow.delegate = self
        buyCar.delegate = self
        buyCycle.delegate = self
        buyBread.delegate = self

        buyCycle.onAnimationType = .oneStroke
//        buyCar.on = true
//        buyBread.isEnabled = false
    }
 
    func didTap(_ checkBox: BEMCheckBox) {
        
        if checkBox.tag == 2 {
            buyCow.on = true
            buyBread.isEnabled = false
        }
        
    }
    
   

}

