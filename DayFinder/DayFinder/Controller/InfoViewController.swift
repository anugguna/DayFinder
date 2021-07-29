//
//  InfoViewController.swift
//  DayFinder
//
//  Created by guna.vendina on 29/07/2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    
    var infoText = ""
    let appDescText = "This is my home-work project"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDescLabel.text = appDescText
        
        if !infoText.isEmpty{
            appInfoLabel.text = infoText
        }
        
    }
    

    

}
