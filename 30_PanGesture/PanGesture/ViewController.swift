//
//  ViewController.swift
//  PanGesture
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: sender.view)
            let changeX = (sender.view?.center.x)! + translation.x
            let changeY = (sender.view?.center.y)! + translation.y
            
            sender.view?.center = CGPoint(x: changeX, y: changeY)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            
            sender.view?.backgroundColor = randomColor()
            
            self.view.backgroundColor = randomColor()
        }
    }
    
    func randomColor() -> UIColor {
        let red =  CGFloat(arc4random_uniform(256)) / 255
        let green =  CGFloat(arc4random_uniform(256)) / 255
        let blue =  CGFloat(arc4random_uniform(256)) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }

    
}

