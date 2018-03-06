//
//  ViewController.swift
//  QRCode
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var codeSelector: UISegmentedControl!
    @IBOutlet weak var displayCodeView: UIImageView!
    
    var filter : CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generatePressed(_ sender: UIButton) {
        
        if let text = dataField.text {
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            if codeSelector.selectedSegmentIndex == 0 {
                filter = CIFilter(name: "CICode128BarcodeGenerator")
            } else {
                filter = CIFilter(name: "CIQRCodeGenerator")
            }
            
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            displayCodeView.image = image
            
        }
    }
    

}

