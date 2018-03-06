//
//  ViewController.swift
//  performSegue
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func unwindSegue ( _ sender: UIStoryboardSegue){
        
        print("This is unwinding")
    }

}

