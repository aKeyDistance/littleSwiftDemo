//
//  RoundButton.swift
//  CaculatorApp
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false {
        
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height/2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height/2
        }
    }
    

}
