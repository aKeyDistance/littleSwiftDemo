//
//  ViewController.swift
//  DoodleApp
//
//  Created by Shaw on 01/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false

    }


    @IBAction func clearPressed(_ sender: UIButton) {
        
        path.removeAllPoints()
        canvasView.layer.sublayers = nil
        canvasView.setNeedsDisplay()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let point = touch?.location(in: canvasView) {
            
            startPoint = point
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let point = touch?.location(in: canvasView) {
            
            touchPoint = point
        }
        
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        drwa()
    }
    
    
    func drwa(){
        
        let strokeLayer = CAShapeLayer()
        
        strokeLayer.fillColor = nil
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.lineWidth = 4
        strokeLayer.path = path.cgPath
        canvasView.layer.addSublayer(strokeLayer)
        canvasView.setNeedsDisplay()
        
        
    }
    
}

