//
//  ViewController.swift
//  colorSlideApp
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var displayView: UIView!
    
    
    var color : Color!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        color = Color(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
    
        displayLabel.text = color.getString()
        displayView.backgroundColor = color.getColor()
    
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        print(sender.value)
        
        if sender.tag == 1 {
            
            color.setRed(red: sender.value)
       
            
        } else if (sender.tag == 2) {
            
            color.setGreen(green: sender.value)

        } else if (sender.tag == 3) {
            
            color.setBlue(blue: sender.value)
        }
        
        displayLabel.text = color.getString()
        displayView.backgroundColor = color.getColor()
    }
    

}

