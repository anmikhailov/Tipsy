//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import UIKit

class ResultViewController: CustomViewController<ResultView> {
    
    var totalPerPerson: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        //TODO: Add format
        customView.setTotalPerPersonLabel(text: String(totalPerPerson))
    }
    
}

extension ResultViewController: ResultViewDelegate {
    func ResultView(_ view: ResultView, didTapRecalculateButton button: UIButton) {
        self.dismiss(animated: true)
    }
}
