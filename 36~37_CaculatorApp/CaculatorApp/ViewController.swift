//
//  ViewController.swift
//  CaculatorApp
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}


class ViewController: UIViewController {

    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    
    var currentOperation:Operation = .NULL
    
    
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            contentLabel.text = runningNumber
        }
        
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        currentOperation = .NULL
        result = ""
        contentLabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        
        if runningNumber.count <= 7 {
            runningNumber += "."
            contentLabel.text = runningNumber
        }
        
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)

    }
    
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)

    }
    
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentLabel.text = "0"
        contentLabel.adjustsFontSizeToFitWidth = true
        
    }

    func operation(operation: Operation){
        
        if currentOperation != .NULL {
            
            if runningNumber != "" {
             
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }  else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }  else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                
                leftValue = result
                
                if (Double(result)!.truncatingRemainder(dividingBy: 1)) == 0{
                     result = "\(Int(Double(result)!))"
                }
                
                contentLabel.text = result
            }
            
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
        
    }

}

