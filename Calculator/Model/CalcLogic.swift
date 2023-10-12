//
//  CalcLogic.swift
//  Calculator
//
//  Created by Nikita Hasan Kafes on 12.10.2023.
//

import Foundation

struct CalcLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    
    func calculate(symbol: String) -> Double? {
        
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number / 100
        }
        
        return nil
    }
    
}
