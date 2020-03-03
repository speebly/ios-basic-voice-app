//
//  ViewController.swift
//  VoiceAppSwiftUI
//
//  Created by Chris Maley on 2019-10-03.
//  Copyright © 2019 Chris Maley. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    
     var suggestions = [INShortcut]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //uper.viewDidAppear(animated)
        
        let title1 = "Event 1"
        let shortCutId1 = "com.speebly.SiriShortCut.Event1"
       activateActivity(title: title1, shortCutId: shortCutId1)
        //event2
        let title2 = "Event 2"
        let shortCutId2 = "com.speebly.SiriShortCut.Event2"
        activateActivity(title: title2, shortCutId: shortCutId2)
        //event3
        let title3 = "Event 3"
        let shortCutId3 = "com.speebly.SiriShortCut.Event3"
        activateActivity(title: title3, shortCutId: shortCutId3)
        let title4 = "Event 4"
        let shortCutId4 = "com.speebly.SiriShortCut.Event4"
        activateActivity(title: title4, shortCutId: shortCutId4)
        
        //event4
        let title5 = "Welcome"
        let shortCutId5 = "com.speebly.SiriShortCut.Welcome"
        activateActivity(title: title5, shortCutId: shortCutId5)
        

        
        INVoiceShortcutCenter.shared.setShortcutSuggestions(suggestions)
     

        
    }
   
    
    func activateActivity(title: String, shortCutId: String ) {
        
        
      let userActivity = NSUserActivity(activityType: shortCutId)
       
        userActivity.title = title
        userActivity.userInfo = ["id": shortCutId]
        userActivity.suggestedInvocationPhrase = title
        //userActivity.isEligibleForPrediction = true
        //userActivity.isEligibleForSearch = true // 4
        //userActivity.persistentIdentifier = shortCutId
        let shortcut = INShortcut(userActivity: userActivity)
        suggestions.append(shortcut)
        
       }
    

    

}
