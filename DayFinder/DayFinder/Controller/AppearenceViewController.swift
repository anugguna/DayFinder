//
//  AppearenceViewController.swift
//  DayFinder
//
//  Created by guna.vendina on 29/07/2021.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        openSettings()
    }
    
    func setLabelText() {
    var text = "Unable to specify IU style"
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode Is On.\nGo to settings if\nyou would like to\nchange to Light Mode."
        }else {
            text = "Light Mode Is On.\nGo to settings if\nyou would like to\nchange to Dark Mode."
        }
        textLabel.text = text
    }
    
    func openSettings(){
        guard let settingURL = URL (string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingURL) {
            UIApplication.shared.open(settingURL, options: [:]) {
                success in
                print("success: ", success)
            }
        }
    }
    
}

//extension
extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
