//
//  ResultView.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
//    func ResultView(_ view: ResultView, didTapRecalculateButton button: UIButton)
}

class ResultView: CustomView {
//    weak var delegate: ResultViewDelegate?
    private lazy var topView: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.mainScreenColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
        
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(topView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
}

//MARK: - Targets
private extension ResultView {
//    @objc func didTapCalculateButton(_ button: UIButton) {
//        delegate?.ResultView(self, didTapCalculateButton: button)
//    }
}
