//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Shaw on 04/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func playPressed(_ sender: UIButton) {
        
        let url = Bundle.main.url(forResource: "sample", withExtension: "mov")
        
        let player = AVPlayer(url: url!)
        let controller = AVPlayerViewController()
        
        controller.player = player
        
        present(controller, animated: true) {
            player.play()
        }
        
    }
    

}

