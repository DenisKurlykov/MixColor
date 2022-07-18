//
//  ViewController.swift
//  MixColor
//
//  Created by Денис Курлыков on 24.06.2022.
//

import UIKit

class SetupViewController: UIViewController {

// MARK: - IBOutlet
    @IBOutlet var mixColorView: UIView!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var setColor: UIColor!
    var delegate: SetupViewControllerDelegate!

    // MARK: - View Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        mixColorView.layer.cornerRadius = 15
        mixColorView.backgroundColor = setColor
        
        viewRgbColor()
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
// MARK: - IBActions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: valueRedLabel)
            setValue(for: redTextField)
        case greenSlider:
            setValue(for: greenSlider)
            setValue(for: greenTextField)
        default:
            setValue(for: valueBlueLabel)
            setValue(for: blueTextField)
        }
        viewRgbColor()
    }
    
    @IBAction func doneButtonpresed() {
        delegate.setNewColor(for: mixColorView.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    // MARK: - Private method
    
    private func viewRgbColor () {
        mixColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
   
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case valueRedLabel: label.text = string(for: redSlider)
            case valueGreenLabel: label.text = string(for: greenSlider)
            default: label.text = string(for: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(for: redSlider)
            case greenTextField: textField.text = string(for: greenSlider)
            default: textField.text = string(for: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: setColor)
        colorSliders.forEach { colorSlider in
            switch colorSlider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }

        
    }

   // Rounding the value for valueLabel
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }


    @objc private func didTapDone() {
        view.endEditing(true)
    }
   
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SetupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text), currentValue <= 1 {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: valueRedLabel)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: valueGreenLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: valueBlueLabel)
            }
            
            viewRgbColor()
            return
        }
        
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}

