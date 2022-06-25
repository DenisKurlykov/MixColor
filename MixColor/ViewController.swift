//
//  ViewController.swift
//  MixColor
//
//  Created by Денис Курлыков on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {

// MARK: IBOutlet_______________________________________________________________
    @IBOutlet var mixColorView: UIView!
    
    @IBOutlet var colorRedLabel: UILabel!
    @IBOutlet var colorGreenLabel: UILabel!
    @IBOutlet var colorBlueLabel: UILabel!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMixColorView()
        
        setupRedSlider()
        setupGreenSlider()
        setupBlueSlider()
        
        setupValueRedLabel()
        setupValueGreenLabel()
        setupValueBlueLabal()
        
        setupColorRedLabel()
        setupColorGreenLabel()
        setupColorBlueLabel()
        
        viewRgbColor()
    }

// MARK: IBActions______________________________________________________________
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

// MARK: Private method_________________________________________________________
// Setup mix color label________________________________________________________
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
    
// Setup color label____________________________________________________________
    private func setupColorRedLabel() {
        colorRedLabel.text = "Red:"
        colorRedLabel.font = UIFont.systemFont(ofSize: 18)
        colorRedLabel.textAlignment = .left
        colorRedLabel.textColor = .red
    }
    private func setupColorGreenLabel() {
        colorGreenLabel.text = "Green:"
        colorGreenLabel.font = UIFont.systemFont(ofSize: 18)
        colorGreenLabel.textAlignment = .left
        colorGreenLabel.textColor = .green
    }
    private func setupColorBlueLabel() {
        colorBlueLabel.text = "Blue:"
        colorBlueLabel.font = UIFont.systemFont(ofSize: 18)
        colorBlueLabel.textAlignment = .left
        colorBlueLabel.textColor = .blue
    }
// Setup value label____________________________________________________________
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
// Setup slider_________________________________________________________________
    private func setupRedSlider() {
        redSlider.value = 0.71
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        redSlider.minimumTrackTintColor = .red
    }
    
    private func setupGreenSlider() {
        greenSlider.value = 0.34
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        greenSlider.minimumTrackTintColor = .green
    }
    
    private func setupBlueSlider() {
        blueSlider.value = 0.12
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
        blueSlider.minimumTrackTintColor = .blue
    }
}


