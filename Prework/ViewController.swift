//
//  ViewController.swift
//  Prework
//
//  Created by Ha Anh on 7/13/22.
//

import UIKit

let skyBlue = UIColor(#colorLiteral(red: 0.5242809057, green: 0.8134652972, blue: 0.8915704489, alpha: 1))
let lemonYellow = UIColor(#colorLiteral(red: 0.8687206507, green: 1, blue: 0.4846069217, alpha: 1))
let steelGray = UIColor(#colorLiteral(red: 0.5672130585, green: 0.6529123187, blue: 0.6875218749, alpha: 1))
let magenta = UIColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
let orange = UIColor(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
let brightGreen = UIColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
var defaultBackgroundColor = skyBlue
var defaultLabelText = ""
var defaultLabelTextColor = UIColor.black
var editedLabelText = ""

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultBackgroundColor = view.backgroundColor!
        defaultLabelText = TextLabel.text!
        defaultLabelTextColor = TextLabel.textColor!
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        LabelTextField.delegate = self // idk why though!
    }
    
    let colors = [skyBlue, lemonYellow, steelGray, magenta, orange, brightGreen]
    
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var LabelTextField: UITextField!
    
    @IBAction func ButtonClicked(_ sender: Any) {
        let currentColor = TextLabel.textColor
        var newColor = currentColor
        while (currentColor == newColor) {
            newColor = colors.randomElement()
        }
        TextLabel.textColor = newColor
    }
    @IBAction func FieldEndedEditing(_ sender: Any) {
    }
    
    @IBAction func BackgroundChangeClicked(_ sender: Any) {
        let currentColor = view.backgroundColor
        var newColor = currentColor
        while (currentColor == newColor) {
            newColor = colors.randomElement()
        }
        view.backgroundColor = newColor
    }
    
    @IBAction func TextGoodbyeChangeClicked(_ sender: Any) {
        TextLabel.text = "Goodbye 👋"
    }
    
    @objc func backgroundTap(gesture: UITapGestureRecognizer) {
        view.backgroundColor = defaultBackgroundColor
        TextLabel.text = defaultLabelText
        TextLabel.textColor = defaultLabelTextColor
    }
    
//    @IBAction func labelTextFieldChange(_ sender: Any) {
//        if (LabelTextField.text != nil || LabelTextField.text != "") {
//            TextLabel.text = LabelTextField.text!
//        } else {
//            TextLabel.text = defaultLabelText
//        }
//        LabelTextField.resignFirstResponder()
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let userInput = textField.text
        if (userInput != nil && !userInput!.isEmpty) {
            TextLabel.text = userInput!
        }
        else if (userInput!.isEmpty) {
            TextLabel.text = defaultLabelText
        }
                
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func changeTextString(_ sender: Any) {
        LabelTextField.becomeFirstResponder()
    }
}

