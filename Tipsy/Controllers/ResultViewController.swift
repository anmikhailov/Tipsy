//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import UIKit

class ResultViewController: CustomViewController<ResultView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
    
}

extension ResultViewController: ResultViewDelegate {
    func ResultView(_ view: ResultView, didTapRecalculateButton button: UIButton) {
        self.dismiss(animated: true)
    }
}
