//
//  AppDelegate.swift
//  PushNotification
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        
        FirebaseApp.configure()
 
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (success, error) in
            if error == nil {
                print("Successful Authorization")
            }
        }
        
        application.registerForRemoteNotifications()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshToken(notification:)), name: NSNotification.Name.InstanceIDTokenRefresh, object: nil)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        Messaging.messaging().shouldEstablishDirectChannel = false
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
        
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    
        
        FBHandler()
    }

    func applicationWillTerminate(_ application: UIApplication) {
     
        
        
    }

    @objc func refreshToken(notification: NSNotification) {
        let refreshToken = InstanceID.instanceID().token()
        
        print("****\(refreshToken)****")
        FBHandler()
    }
    
    
    func FBHandler(){
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    

    
    
    
}

