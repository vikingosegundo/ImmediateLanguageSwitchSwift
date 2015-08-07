//
//  ViewController.swift
//  ImmediateLanguageSwitchSwift
//
//  Created by Manuel Meyer on 07.08.15.
//
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func languageDidChange() {
        super.languageDidChange()
        self.helloLabel.text = NSLocalizedString("Hello", comment: "")

    }
}

