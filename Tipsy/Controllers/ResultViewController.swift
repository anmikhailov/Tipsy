//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import UIKit

class ResultViewController: CustomViewController<ResultView> {
    
    var totalPerPerson: Float = 0.0
    var numberOfPeople: Int = 1
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        customView.setTotalPerPersonLabel(text: String(format: "%.2f", totalPerPerson))
        customView.setSettingsLabel(numberOfPeople: String(numberOfPeople), tip: String(tip))
    }
    
}

extension ResultViewController: ResultViewDelegate {
    func ResultView(_ view: ResultView, didTapRecalculateButton button: UIButton) {
        self.dismiss(animated: true)
    }
}
