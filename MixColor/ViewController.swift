//
//  ViewController.swift
//  MixColor
//
//  Created by Денис Курлыков on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: - IBOutlet
    @IBOutlet var mixColorView: UIView!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMixColorView()
        
        redSlider.value = 0.71
        greenSlider.value = 0.34
        blueSlider.value = 0.12
        
        setupValueRedLabel()
        setupValueGreenLabel()
        setupValueBlueLabal()

        viewRgbColor()
    }
    
// MARK: - IBActions
    
    @IBAction func redSliderAction() {
        viewRgbColor()
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func greenSliderAction() {
        viewRgbColor()
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func blueSliderAction() {
        viewRgbColor()
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
    }

    // MARK: - Private method
    
    // Setup mix color label
    private func setupMixColorView() {
        mixColorView.layer.cornerRadius = 15
    }
    
    private func viewRgbColor () {
        mixColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    // Setup color label
    private func setupLabel(
        label: UILabel,
        textFont: UIFont,
        text: String,
        alignment: NSTextAlignment,
        textColor: UIColor
    ) {
        label.text = text
        label.textAlignment = alignment
        label.font = textFont
        label.textColor = textColor
    }
    
    // Setup value label
    private func setupValueRedLabel() {
        valueRedLabel.text = String(redSlider.value)
        valueRedLabel.font = UIFont.systemFont(ofSize: 18)
        valueRedLabel.textAlignment = .left
        valueRedLabel.textColor = .red
    }
    private func setupValueGreenLabel() {
        valueGreenLabel.text = String(greenSlider.value)
        valueGreenLabel.font = UIFont.systemFont(ofSize: 18)
        valueGreenLabel.textAlignment = .left
        valueGreenLabel.textColor = .green
    }
    private func setupValueBlueLabal() {
        valueBlueLabel.text = String(blueSlider.value)
        valueBlueLabel.font = UIFont.systemFont(ofSize: 18)
        valueBlueLabel.textAlignment = .left
        valueBlueLabel.textColor = .blue
    }
}


