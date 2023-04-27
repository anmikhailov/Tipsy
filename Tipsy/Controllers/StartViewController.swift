//
//  MainViewController.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

class StartViewController: CustomViewController<StartView> {
    
    let calculatorManager = CalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
}

extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapTipButton button: UIButton) {
        let tipValueString = button.restorationIdentifier!
        calculatorManager.tipPercentageString = tipValueString
        customView.tipChanged(sender: button)
    }
    
    func StartView(_ view: StartView, didTapStepper stepper: UIStepper) {
        let stepperValue = Int(stepper.value)
        calculatorManager.numberOfPerson = stepperValue
        customView.changePerson(number: stepperValue)
    }
    
    func StartView(_ view: StartView, didTapCalculateButton button: UIButton) {
        calculatorManager.billTotal = Float(customView.getTextFieldData()) ?? 0.0
        
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.totalPerPerson = calculatorManager.getTotalPerPerson()
        resultVC.numberOfPeople = calculatorManager.getSettings().numberOfPerson
        resultVC.tip = calculatorManager.getSettings().tipInt
        self.present(resultVC, animated: true)
    }
}
