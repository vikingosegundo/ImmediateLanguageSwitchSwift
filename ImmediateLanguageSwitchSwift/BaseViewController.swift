//
//  BaseViewController.swift
//  ImmediateLanguageSwitchSwift
//
//  Created by Manuel Meyer on 07.08.15.
//
//

import UIKit



class BaseViewController: UIViewController {

    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "languageDidChangeNotification:", name: "LANGUAGE_DID_CHANGE", object: nil)
        languageDidChange()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchLanguage(sender: UIButton) {
        
        var localeString:String?
        switch sender {
        case englishButton: localeString = "en"
        case spanishButton: localeString = "es"
        default: localeString = nil
        }
        
        
        if localeString != nil {
            NSNotificationCenter.defaultCenter().postNotificationName("LANGUAGE_WILL_CHANGE", object: localeString)
        }
    }
    
    
    func languageDidChangeNotification(notification:NSNotification){
        languageDidChange()
    }
    
    func languageDidChange(){
        
    }
    

}
