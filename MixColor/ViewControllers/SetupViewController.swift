//
//  ViewController.swift
//  MixColor
//
//  Created by Денис Курлыков on 24.06.2022.
//

import UIKit

class SetupViewController: UIViewController, UITextFieldDelegate {

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
        
        setSlider()
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)

        viewRgbColor()
        
        addDoneButton(
            to: redTextField,
                greenTextField,
                blueTextField
        )
    }
    
// MARK: - IBActions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        viewRgbColor()
        switch sender {
        case redSlider:
            valueRedLabel.text = string(for: redSlider)
            redTextField.text = string(for: redSlider)
        case greenSlider:
            valueGreenLabel.text = string(for: greenSlider)
            greenTextField.text = string(for: greenSlider)
        default:
            valueBlueLabel.text = string(for: blueSlider)
            blueTextField.text = string(for: blueSlider)
        }
    }
    @IBAction func doneButtonpresed() {
        delegate.setNewColor(for: mixColorView.backgroundColor ?? UIColor.white)
        dismiss(animated: true)
    }
    
    // MARK: - Private method
    
    private func setSlider() {
        let color = CIColor(color: setColor)
        redSlider.value = Float(color.red)
        greenSlider.value = Float(color.green)
        blueSlider.value = Float(color.blue)
    }
   
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
    

   // Rounding the value for valueLabel
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func addDoneButton(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(
                title:"Done",
                style: .done,
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
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }

}

////MARK: - UITextFieldDelegate
//extension SetupViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let newValue = textField.text else { return }
//        guard let numberValue = Float(newValue) else { return }
//        if textField =
//    }
//}
// ЗДЕСЬ Я ОКОНЧАТЕЛЬНО ЗАПУТАЛСЯ

