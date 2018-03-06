//
//  ViewController.swift
//  AnimationChaining
//
//  Created by Shaw on 01/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var mainViewContrstraint: NSLayoutConstraint!
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainViewContrstraint.constant = -195
        
        for i in [bgImageView,mainView,welcomeLabel,continueBtn] {
            i?.alpha = 0
        }
        
        UIView.animate(withDuration: 1, animations: {
             self.bgImageView.alpha = 1
        }) { (true) in
            self.mainViewAnimation()
        }
    }
    
   func  mainViewAnimation(){
    
        UIView.animate(withDuration: 2, animations: {
            self.mainView.alpha = 1
            self.mainViewContrstraint.constant = 0
            self.view.layoutIfNeeded()
        }) { (true) in
            self.welcomeLabelAnimation()
        }
    }
    
    func welcomeLabelAnimation(){
        UIView.animate(withDuration: 1, animations: {
            self.welcomeLabel.alpha = 1
        }) { (true) in
            self.continueBtnAnimation()
        }
    }

    func continueBtnAnimation(){
        UIView.animate(withDuration: 1) {
            self.continueBtn.alpha = 1
        }
    }
    
}
    


