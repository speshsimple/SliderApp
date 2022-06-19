//
//  ViewController.swift
//  SliderApp
//
//  Created by Alex Novikov on 31.05.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var bigView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }
    
    private func createColor() {
        bigView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    private func sendTextToSlider(textfield: UITextField!, slider: UISlider) {
        
        guard let inputText = textfield.text,
              !inputText.isEmpty else { return }
        
        if let _ = Float(inputText) {
            slider.value = Float(inputText)!
        } else { return }
    }
    
    private func roundSliderValueToLebelAndTextField(slider: UISlider,
                                                     label: UILabel,
                                                     textField: UITextField) {
        
        label.text = String(roundf(slider.value * 100) / 100)
        textField.text = String(roundf(slider.value * 100) / 100)
    }
    
    @IBAction func changeColorViewSliderRed() {
        createColor()
        roundSliderValueToLebelAndTextField(slider: redSlider,
                                            label: redLabel,
                                            textField: redTextField)
    }
    
    @IBAction func changeColorViewSliderGreen() {
        createColor()
        roundSliderValueToLebelAndTextField(slider: greenSlider,
                                            label: greenLabel,
                                            textField: greenTextField)
    }
    
    @IBAction func changeColorViewSliderBlue() {
        createColor()
        roundSliderValueToLebelAndTextField(slider: blueSlider,
                                            label: blueLabel,
                                            textField: blueTextField)
    }
    
    @IBAction func chengeRedSliderValue() {
        sendTextToSlider(textfield: redTextField, slider: redSlider)
        changeColorViewSliderRed()
    }
    
    @IBAction func changeGreenSliderValue() {
        sendTextToSlider(textfield: greenTextField, slider: greenSlider)
        changeColorViewSliderGreen()
    }
    
    @IBAction func changeBlueSliderValue() {
        sendTextToSlider(textfield: blueTextField, slider: blueSlider)
        changeColorViewSliderBlue()
    }
    
}

extension UITextField {

    func addDoneButtonOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyboardToolbar
    }
}


extension ViewController {
    private func setupView() {
        
        bigView.layer.cornerRadius = 10
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        blueSlider.tintColor = .blue
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        redSlider.minimumValue = 0
        greenSlider.minimumValue = 0
        blueSlider.minimumValue = 0
        
        redSlider.maximumValue = 1
        greenSlider.maximumValue = 1
        blueSlider.maximumValue = 1
        
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
        
        redTextField.keyboardType = .decimalPad
        greenTextField.keyboardType = .decimalPad
        blueTextField.keyboardType = .decimalPad
        
        redTextField.addDoneButtonOnKeyboard()
        greenTextField.addDoneButtonOnKeyboard()
        blueTextField.addDoneButtonOnKeyboard()
    }
}

