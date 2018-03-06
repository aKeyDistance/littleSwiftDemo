//
//  ViewController.swift
//  AlertView
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

   
    @IBAction func savePressed(_ sender: UIButton) {
        
        let alertView = UIAlertController(title: "Save", message: "Do you really want to save?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.displayLabel.text = "Save canceled"
        }
        
        let save = UIAlertAction(title: "Save", style: .default) { (action) in
            self.displayLabel.text = "Save Successful"
        }
        
        alertView.addAction(cancel)
        alertView.addAction(save)

        present(alertView, animated: true, completion: nil)
    }
    

}

