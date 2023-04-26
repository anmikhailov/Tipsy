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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
}

extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapTipButton button: UIButton) {
        let tipValueString = button.restorationIdentifier!
        tipValue = Float(Int(tipValueString)!) / Float(100)
        customView.tipChanged(sender: button)
    }
    
    func StartView(_ view: StartView, didTapStepper stepper: UIStepper) {
        personNumber = Int(stepper.value)
        customView.changePerson(number: personNumber)
    }
    
    func StartView(_ view: StartView, didTapCalculateButton button: UIButton) {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        self.present(resultVC, animated: true)
        print(tipValue)
    }
}
