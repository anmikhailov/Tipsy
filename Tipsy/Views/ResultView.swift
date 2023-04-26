//
//  ResultView.swift
//  Tipsy
//
//  Created by Andrey on 26.04.2023.
//

import UIKit

protocol ResultViewDelegate: AnyObject {
    func ResultView(_ view: ResultView, didTapRecalculateButton button: UIButton)
}

class ResultView: CustomView {
    weak var delegate: ResultViewDelegate?
    
    private lazy var topView: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.mainScreenColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var totalPerPersonLabel: UILabel = {
        let element = UILabel()
        element.text = "Total per person"
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 30)
        element.textColor = .lightGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var moneyLabel: UILabel = {
        let element = UILabel()
        element.text = "34.23"
        element.textAlignment = .center
        element.font = UIFont.boldSystemFont(ofSize: 45)
        element.textColor = Resources.Colors.textFieldColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var settingsLabel: UILabel = {
        let element = UILabel()
        element.text = "Split between 2 people,\nwith 10% tip"
        element.numberOfLines = 2
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var recalculateButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "Recalculate"
        element.backgroundColor = Resources.Colors.textFieldColor
        element.setTitle("Recalculate", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapRecalculateButton), for: .touchUpInside)
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(topView)
        self.addSubview(totalPerPersonLabel)
        self.addSubview(moneyLabel)
        self.addSubview(settingsLabel)
        self.addSubview(recalculateButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 300),
            
            totalPerPersonLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            totalPerPersonLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            totalPerPersonLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            moneyLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor, constant: 30),
            moneyLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            moneyLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            settingsLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 35),
            settingsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            settingsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            recalculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 65),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    func setTotalPerPersonLabel(text: String) {
        moneyLabel.text = text
    }
}

//MARK: - Targets
private extension ResultView {
    @objc func didTapRecalculateButton(_ button: UIButton) {
        delegate?.ResultView(self, didTapRecalculateButton: button)
    }
}
