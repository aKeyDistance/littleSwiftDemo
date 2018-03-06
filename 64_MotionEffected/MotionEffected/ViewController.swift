//
//  ViewController.swift
//  MotionEffected
//
//  Created by Shaw on 05/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var backgroundImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backgroundImg.isUserInteractionEnabled = true
        logoImg.isUserInteractionEnabled = true 
        applyEffect(onView: backgroundImg, magnitude: 15)
        
        applyEffect(onView: logoImg, magnitude: -10)
    }

   
    func applyEffect(onView:UIView, magnitude:Double) {
        
        
        let xAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xAxisEffect.minimumRelativeValue = -magnitude
        xAxisEffect.maximumRelativeValue = magnitude
        
        
        let yAxisEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yAxisEffect.minimumRelativeValue = -magnitude
        yAxisEffect.maximumRelativeValue = magnitude
        
        let effectGroups = UIMotionEffectGroup()
        effectGroups.motionEffects = [xAxisEffect,yAxisEffect]
        
        onView.addMotionEffect(effectGroups)
        
    }

}

