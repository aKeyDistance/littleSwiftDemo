//
//  ViewController.swift
//  Webview
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url  = URL(string: "https://www.google.com")
        let request = URLRequest(url:url!)

        webview.load(request)
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

}

