//
//  ViewController.swift
//  FirstApp
//
//  Created by Aldo Coroneo on 30/05/2020.
//  Copyright © 2020 Aldo Coroneo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UITextField!
    @IBOutlet weak var calculatorButton: UIButton!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var textFieldLore: UITextField!
    
    var priceNumber: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🤯", #function)
        self.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        self.resultLabel.text = "0,00 $"
        self.resultView.isHidden = true
        self.calculatorButton.isHidden = true
    }
    
    @IBAction func calculatorButton_touchUpInside(_ sender: UIButton) {
        textFieldLore.resignFirstResponder()
        guard let number = priceNumber else {
            return
        }
        let finalPrice = number + (number * 0.22)
        self.resultLabel.text = "\(finalPrice)"
        self.resultView.isHidden = false
    }
    
    @IBAction func priceTextField_editingChanged(_ sender: UITextField) {
        guard
            let text = sender.text,
            let number = Double.init(text)
            else {
                self.calculatorButton.isHidden = true
                self.resultView.isHidden = true
                return
        }
        
        guard number != 0.0 else {
            print("🤯 is not a valid number")
            self.calculatorButton.isHidden = true
            self.resultView.isHidden = true
            return
        }
        
        self.calculatorButton.isHidden = false
        self.priceNumber = number
        print("🤯", text)
    }
    
    @IBAction func priceTextField_didEndOnExit(_ sender: UITextField) {
        print("🤯", #function)
        sender.resignFirstResponder()
    }
    
}

