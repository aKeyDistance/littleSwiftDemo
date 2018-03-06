//
//  ViewController.swift
//  loadPDF
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = Bundle.main.path(forResource: "test", ofType: "pdf")
        let url = URL(fileURLWithPath:path!)
        let request = URLRequest(url: url)
        
       webView.loadRequest(request)
    }

   


}

