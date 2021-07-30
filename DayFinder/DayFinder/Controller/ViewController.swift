//
//  ViewController.swift
//  DayFinder
//
//  Created by guna.vendina on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dayInput: UITextField!
    @IBOutlet weak var monthInput: UITextField!
    @IBOutlet weak var yearInput: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var buttonFIND: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        dayInput.layer.cornerRadius = 10
        monthInput.layer.cornerRadius = 10
        yearInput.layer.cornerRadius = 10
        buttonFIND.layer.cornerRadius = 10
        resultLabel.layer.cornerRadius = 10
    }
    //MARK: - findWeekdayTapped
    @IBAction func findWeekdayTapped(_ sender: Any) {
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        guard let day = Int(dayInput.text!), let month = Int(monthInput.text!), let year = Int(yearInput.text!) else {
            clearResultField()            //alert
            warningPopup(withTitle: "Input Error!", withMassage: "Please enter the correct date!")
            return
        }
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch  buttonFIND.titleLabel?.text{
        case "FIND":
            buttonFIND.setTitle("CLEAR", for: .normal)
            if day >= 1 && day <= 31 && month >= 1 && month <= 12 {
                let weekday = dateFormatter.string(from: date)
                self.resultLabel.text = weekday.capitalized
                self.resultLabel.layer.borderColor = UIColor.yellow.cgColor
                self.resultLabel.layer.borderWidth = 3
                
            }else{
                clearResultField()
                //alert
                warningPopup(withTitle: "Wrong Date!", withMassage: "Please enter the correct date!")
                
            }
        default:
            buttonFIND.setTitle("FIND", for: .normal)
            clearResultField()
            self.resultLabel.layer.borderColor = nil
            self.resultLabel.layer.borderWidth = 0      //alert
        }
    
    }
    func clearResultField(){
        dayInput.text = ""
        monthInput.text = ""
        yearInput.text = ""
        resultLabel.text = "Day of the week, inside your finder"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
    func warningPopup(withTitle title: String?, withMassage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController (title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction (title: "OK", style: .cancel, handler: nil)
            
            popUp.addAction(okButton)
            self.present(popUp, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dayFinder" {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! InfoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "DayFinder app finds \na weekday for given date."}
    }
    }

