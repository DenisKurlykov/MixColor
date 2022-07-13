//
//  StartViewController.swift
//  MixColor
//
//  Created by Денис Курлыков on 12.07.2022.
//

import UIKit

protocol SetupViewControllerDelegate {
    func setNewColor(for mixColor: UIColor)
}

class StartViewController: UIViewController {


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let
                setupVC = segue.destination as? SetupViewController
        else { return }
        setupVC.setColor = view.backgroundColor
        setupVC.delegate = self
    }
}

//MARK: - SetupViewControllerDelegate
extension StartViewController: SetupViewControllerDelegate {
    func setNewColor(for mixColor: UIColor) {
        view.backgroundColor = mixColor
    }
}


