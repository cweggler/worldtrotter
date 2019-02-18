//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Cara on 2/5/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit

// This uses the UITextFieldDelegate
class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else{
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        //this sets what the color is in daytime mode, not dark mode
        self.view.backgroundColor = UIColor.init(red: 0.73, green: 0.73, blue: 0.92, alpha: 1)
        
        updateCelsiusLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Convert View appears")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // This helps set up a Dark Mode, the background becomes a deeper shade of purple
        let now = Date() // this gets the current Date and time
        let hour = Calendar.current.component(.hour, from: now) // this gets the hour
        if hour >= 17 {
            // if the hour is 5pm-11pm change the color to this deeper purple
            self.view.backgroundColor = UIColor.init(red: 0.19, green: 0.19, blue: 0.96, alpha: 1)
        }
        if hour >= 0 && hour <= 5 {
            // if the hour is 12am-5am change the color to this deeper purple
            self.view.backgroundColor = UIColor.init(red: 0.19, green: 0.19, blue: 0.96, alpha: 1)
        }
    }
        
    
    // This belongs to UITextFieldDelegate
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparateor = string.range(of: ".")
        
        let replacementTextHasAlphaCharacter = string.rangeOfCharacter(from: NSCharacterSet.letters)
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparateor != nil {
            return false
        }
        
        else if replacementTextHasAlphaCharacter != nil {
            return false
        } else {
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let temp = fahrenheitValue?.value
        if let t = temp, t < 25.0 {
            let alert = UIAlertController(title: "Brrr!", message: "\(t)F is cold", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    
    
    
}
