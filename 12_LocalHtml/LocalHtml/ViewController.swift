//
//  ViewController.swift
//  LocalHtml
//
//  Created by Shaw on 10/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var webView: WKWebView!
    
    
    
    
    
    
}

