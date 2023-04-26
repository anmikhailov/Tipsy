//
//  MainViewController.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

class StartViewController: CustomViewController<StartView> {
       
    var tipValue: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
}

extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapTipButton button: UIButton) {
        tipValue = Float(Int(button.restorationIdentifier!)!) / Float(100)
        customView.tipChanged(sender: button)
    }
}
