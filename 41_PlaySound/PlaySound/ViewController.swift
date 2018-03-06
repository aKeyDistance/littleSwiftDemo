//
//  ViewController.swift
//  PlaySound
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audoiPlayer: AVAudioPlayer!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "Inukshuk", withExtension: "mp3")
        
        do {
            audoiPlayer = try AVAudioPlayer(contentsOf: url!)
            audoiPlayer.prepareToPlay()
            audoiPlayer.currentTime = 0
            displayLabel.text = "\(audoiPlayer.currentTime)"
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in
                self.displayLabel.text = "\(round(self.audoiPlayer.currentTime*10)/10)"
            })
            
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }

    @IBAction func playPressed(_ sender: UIButton) {
        audoiPlayer.play()
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        audoiPlayer.pause()
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        audoiPlayer.stop()
        audoiPlayer.currentTime = 0
    }
    
}

