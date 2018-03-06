//
//  ViewController.swift
//  swipeSlideMenu
//
//  Created by Shaw on 02/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var blueView: UIVisualEffectView!
    
    @IBOutlet weak var viewConstrant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        blueView.layer.cornerRadius = 15
        
        
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        viewConstrant.constant = -245
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func panPerform(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            if translation > 0 {
                
                if viewConstrant.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstrant.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
                
            } else {
                if viewConstrant.constant > -235 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstrant.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended {
            
            if viewConstrant.constant < -100 {
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstrant.constant = -245
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstrant.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    


}

