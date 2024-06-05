//
//  AppDelegate.swift
//  Feed Screen
//
//  Created by Kibbcom on 20/03/24.
//

import UIKit
import UserNotifications
import CoreData
    
@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate{

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CoreDataStack.shared.setupCoreDataModel()
        
        if #available(iOS 16.0, *) {
            print("Database path", URL.documentsDirectory)
        } else {
            // Fallback on earlier versions
            print("Database not found")
        }
        
       
        
//        notification delegate
        UNUserNotificationCenter.current().delegate = self
//        // Override point for customization after application launch.
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    //MARK: User notification function
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Show the notification alert, sound, and badge when the app is in the foreground
        completionHandler([.alert, .sound, .badge])
    }
    

    // Handle notifications tapped or interacted with by the user
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        // Handle the notification response here
//        completionHandler()
//    }
   
}



