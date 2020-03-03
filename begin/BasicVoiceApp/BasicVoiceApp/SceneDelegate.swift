//
//  SceneDelegate.swift
//  test4
//
//  Created by Chris Maley on 2020-01-06.
//  Copyright © 2020 Chris Maley. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        UIApplication.shared.isIdleTimerDisabled = true
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
          
            //Standard implementation until here
            if connectionOptions.userActivities.first != nil {
                
                let userActivity = connectionOptions.userActivities.first
                var eventName:String = "welcome"
                if userActivity?.activityType == "com.speebly.SiriShortCut.Event1" {
                    eventName = "event1"
                }
                else if userActivity?.activityType == "com.speebly.SiriShortCut.Event2" {
                    eventName = "event2"
                }
                else if userActivity?.activityType == "com.speebly.SiriShortCut.Event3" {
                    eventName = "event3"
                }
                else if userActivity?.activityType == "com.speebly.SiriShortCut.Event4" {
                    eventName = "event4"
                }
                
                window.rootViewController = UIHostingController(rootView:  ContentView(eventName: eventName, isVoice: true))
                self.window = window
                window.makeKeyAndVisible()
                
            }
            else {
                window.rootViewController = UIHostingController(rootView:  ContentView(eventName: "welcome", isVoice: false))
                self.window = window
                window.makeKeyAndVisible()
            }
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        var eventName:String = "welcome"
        if userActivity.activityType == "com.speebly.SiriShortCut.Event1" {
            eventName = "event1"
        }
        else if userActivity.activityType == "com.speebly.SiriShortCut.Event2" {
            eventName = "event2"
        }
        else if userActivity.activityType == "com.speebly.SiriShortCut.Event3" {
            eventName = "event3"
        }
        else if userActivity.activityType == "com.speebly.SiriShortCut.Evemt4" {
            eventName = "event4"
        }
        
            
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView:  ContentView(eventName: eventName, isVoice: true))
            self.window = window
            window.makeKeyAndVisible()
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

