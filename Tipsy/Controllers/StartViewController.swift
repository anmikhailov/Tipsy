//
//  MainViewController.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

class StartViewController: CustomViewController<StartView> {
       
    var tipValue: Float = 0.0
    var personNumber = 1
    
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
        personNumber = Int(stepper.value)
        customView.changePerson(number: personNumber)
    }
    
    func StartView(_ view: StartView, didTapCalculateButton button: UIButton) {
        calculatorManager.billTotal = Float(customView.getTextFieldData()) ?? 0.0
        
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.totalPerPerson = calculatorManager.getTotalPerPerson()
        self.present(resultVC, animated: true)
        print(calculatorManager.getTotalPerPerson())
    }
}
