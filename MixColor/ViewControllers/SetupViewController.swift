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
    
    var setColor: UIColor!
    var delegate: SetupViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mixColorView.layer.cornerRadius = 15
        mixColorView.backgroundColor = setColor
        
        setSlider()
        
        setupValueRedLabel()
        setupValueGreenLabel()
        setupValueBlueLabal()

        viewRgbColor()
    }
    
// MARK: - IBActions
    
    @IBAction func sliderAction(_ sender: UISlider) {
        viewRgbColor()
        switch sender {
        case redSlider:
            valueRedLabel.text = string(for: redSlider)
        case greenSlider:
            valueGreenLabel.text = string(for: greenSlider)
        default:
            valueBlueLabel.text = string(for: blueSlider)
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

    
    // Setup value label
    private func setupValueRedLabel() {
        valueRedLabel.text = String(redSlider.value)

    }
    private func setupValueGreenLabel() {
        valueGreenLabel.text = String(greenSlider.value)

    }
    private func setupValueBlueLabal() {
        valueBlueLabel.text = String(blueSlider.value)

    }

   // Rounding the value for valueLabel
    private func string(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

}



