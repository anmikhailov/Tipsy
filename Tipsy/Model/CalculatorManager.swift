//
//  CalculatorManager.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import Foundation

class CalculatorManager {
    var billTotal: Float = 0.0
    var tipPercentage: Float = 0.0
    var tipPercentageString = ""
    var numberOfPerson = 1
    
    func getTotalPerPerson() -> Float {
        let tipPercentageFloat = Float(tipPercentageString) ?? 0.0
        tipPercentage = tipPercentageFloat / 100.0
        return (billTotal + billTotal * tipPercentage) / Float(numberOfPerson)
    }
}
