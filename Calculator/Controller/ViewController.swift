//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita Hasan Kafes on 12.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            let calculator = CalcLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if sender.currentTitle == "." && displayLabel.text!.contains(".") {
            return
        }
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber && numValue != "."{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text?.append(numValue)
            }
            
        }
    }
}

