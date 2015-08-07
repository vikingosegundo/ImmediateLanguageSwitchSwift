//
//  AppDelegate.swift
//  ImmediateLanguageSwitchSwift
//
//  Created by Manuel Meyer on 07.08.15.
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "languageWillChange:", name: "LANGUAGE_WILL_CHANGE", object: nil)
        
        let targetLang = NSUserDefaults.standardUserDefaults().objectForKey("selectedLanguage") as? String
        
        NSBundle.setLanguage((targetLang != nil) ? targetLang : "en")
        return true
    }

    func languageWillChange(notification:NSNotification){
        let targetLang = notification.object as! String
        NSUserDefaults.standardUserDefaults().setObject(targetLang, forKey: "selectedLanguage")
        NSBundle.setLanguage(targetLang)
        NSNotificationCenter.defaultCenter().postNotificationName("LANGUAGE_DID_CHANGE", object: targetLang)
    }
    

}

