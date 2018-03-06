//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Shaw on 03/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .gray
        self.view.addSubview(activityIndicator)
        

    }

    @IBAction func startPressed(_ sender: UIButton) {
    
        activityIndicator.startAnimating()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        displayLabel.text = "Firing up service"
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            
            UIApplication.shared.endIgnoringInteractionEvents()
            self.activityIndicator.stopAnimating()
            self.displayLabel.text = "Good to Go"
        }
    }
    
    
    @IBAction func stopPressed(_ sender: UIButton) {
        
        
        displayLabel.text = "I'm Stoped"
    }
    

}

