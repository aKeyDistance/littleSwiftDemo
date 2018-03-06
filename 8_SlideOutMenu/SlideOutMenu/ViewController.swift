//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by Shaw on 10/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var isSlideMenuHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuConstraint.constant = -140
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func organizeBtnPressed(_ sender: UIBarButtonItem) {
        
        if isSlideMenuHidden {
            sideMenuConstraint.constant = 0
            
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
            
        } else {
            sideMenuConstraint.constant = -140
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        isSlideMenuHidden = !isSlideMenuHidden
    }
    
}















