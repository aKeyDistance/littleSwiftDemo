//
//  ViewController.swift
//  UserNotification
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (success,error) in
            
            if error != nil {
                print("Authorization Unsuccessfule")
            } else {
                print("Authorization Successfule")
            }
        }
    }

    @IBAction func notifyPressed(_ sender: UIButton) {
        
        timedNotification(inSeconds: 3) { (success) in
            
            if success {
                print("Successfully Notified")
            }
        }
    }
    
    
    func timedNotification(inSeconds:TimeInterval,completion: @escaping(_ Success:Bool) -> ()){
        
        guard let imageURL = Bundle.main.url(forResource: "source", withExtension: "gif") else {
            completion(false)
            return
        }
        
        let attachment = try! UNNotificationAttachment(identifier: "tenor", url: imageURL, options: .none)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Breaking News"
        content.subtitle = "Net Neutrality is not working"
        content.body = "timedNotificationtimedNotificationtimedNotificationtimedNotificationtimedNotification"
        content.attachments = [attachment]
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request){ (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
        
    }

}

