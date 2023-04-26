//
//  MainView.swift
//  EmptyProject
//
//  Created by Andrey on 25.04.2023.
//

import UIKit

protocol StartViewDelegate: AnyObject {
    func StartView(_ view: StartView, didTapTipButton button: UIButton)
    func StartView(_ view: StartView, didTapCalculateButton button: UIButton)
    func StartView(_ view: StartView, didTapStepper stepper: UIStepper)
}

class StartView: CustomView {
    weak var delegate: StartViewDelegate?
    
    private lazy var titleUITextField: UILabel = {
        let element = UILabel()
        element.text = "Enter bill total"
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var textField: UITextField = {
        let element = UITextField()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        element.attributedPlaceholder = NSAttributedString(string: "e.g. 123.56", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 40),
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
        
        element.textColor = Resources.Colors.textFieldColor
        element.textAlignment = .center
        //TODO: bold font and add input mask
        element.font = UIFont.systemFont(ofSize: 40)
        
        element.keyboardType = .decimalPad
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var centerView: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.mainScreenColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
        
    }()
    
    private lazy var tipLabel: UILabel = {
        let element = UILabel()
        element.text = "Select tip"
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var tipButtonsHStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.distribution = .equalSpacing
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var zeroPercentButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "0"
        element.setTitle("0%", for: .normal)
        element.setTitleColor(Resources.Colors.textFieldColor, for: .normal)
        element.setBackgroundImage(imageWithColor(.init(white: 0, alpha: 0)), for: .normal)
        element.setTitleColor(.white, for: .selected)
        element.setBackgroundImage(imageWithColor(Resources.Colors.textFieldColor), for: .selected)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.layer.cornerRadius = 8
        element.layer.masksToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        return element
    }()
    
    private lazy var tenPercentButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "10"
        element.setTitle("10%", for: .normal)
        element.setTitleColor(Resources.Colors.textFieldColor, for: .normal)
        element.setBackgroundImage(imageWithColor(.init(white: 0, alpha: 0)), for: .normal)
        element.setTitleColor(.white, for: .selected)
        element.setBackgroundImage(imageWithColor(Resources.Colors.textFieldColor), for: .selected)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.layer.cornerRadius = 8
        element.layer.masksToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        return element
    }()
    
    private lazy var twentyPercentButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "20"
        element.setTitle("20%", for: .normal)
        element.setTitleColor(Resources.Colors.textFieldColor, for: .normal)
        element.setBackgroundImage(imageWithColor(.init(white: 0, alpha: 0)), for: .normal)
        element.setTitleColor(.white, for: .selected)
        element.setBackgroundImage(imageWithColor(Resources.Colors.textFieldColor), for: .selected)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.layer.cornerRadius = 8
        element.layer.masksToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapTipButton), for: .touchUpInside)
        return element
    }()
    
    private lazy var chooseSplitLabel: UILabel = {
        let element = UILabel()
        element.text = "Choose Split"
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .lightGray
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var splitHStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .fill
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var splitLabel: UILabel = {
        let element = UILabel()
        element.text = "1"
        element.font = UIFont.systemFont(ofSize: 35)
        element.textColor = Resources.Colors.textFieldColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var splitStepper: UIStepper = {
        let element = UIStepper()
        element.minimumValue = 1
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapStepper), for: .valueChanged)
        return element
    }()
    
    private lazy var calculateButton: UIButton = {
        let element = UIButton()
        element.restorationIdentifier = "Calculate"
        element.backgroundColor = Resources.Colors.textFieldColor
        element.setTitle("Calculate", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        element.layer.cornerRadius = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(titleUITextField)
        self.addSubview(textField)
        self.addSubview(centerView)
        self.addSubview(tipLabel)
        self.addSubview(tipButtonsHStack)
        self.addSubview(chooseSplitLabel)
        self.addSubview(splitHStack)
        self.addSubview(calculateButton)
        
        tipButtonsHStack.addArrangedSubview(zeroPercentButton)
        tipButtonsHStack.addArrangedSubview(tenPercentButton)
        tipButtonsHStack.addArrangedSubview(twentyPercentButton)
        
        splitHStack.addArrangedSubview(splitLabel)
        splitHStack.addArrangedSubview(splitStepper)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleUITextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleUITextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            
            textField.topAnchor.constraint(equalTo: titleUITextField.bottomAnchor, constant: 10),
            textField.heightAnchor.constraint(equalToConstant: 100),
            textField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            centerView.topAnchor.constraint(equalTo: textField.bottomAnchor),
            centerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            centerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            centerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            tipLabel.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20),
            tipLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 50),
            
            tipButtonsHStack.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 20),
            tipButtonsHStack.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 60),
            tipButtonsHStack.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -60),
            
            zeroPercentButton.heightAnchor.constraint(equalToConstant: 50),
            zeroPercentButton.widthAnchor.constraint(equalToConstant: 90),
            
            tenPercentButton.heightAnchor.constraint(equalToConstant: 50),
            tenPercentButton.widthAnchor.constraint(equalToConstant: 90),
            
            twentyPercentButton.heightAnchor.constraint(equalToConstant: 50),
            twentyPercentButton.widthAnchor.constraint(equalToConstant: 90),
            
            chooseSplitLabel.topAnchor.constraint(equalTo: tipButtonsHStack.bottomAnchor, constant: 40),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 50),
            
            splitHStack.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 30),
            splitHStack.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            splitHStack.widthAnchor.constraint(equalToConstant: 170),
            
            calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 65),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func tipChanged(sender: UIButton) {
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        
        textField.endEditing(true)
    }
    
    func changePerson(number: Int) {
        splitLabel.text = String(number)
        textField.endEditing(true)
    }
}

//MARK: - Actions
private extension StartView {
    @objc func didTapTipButton(_ button: UIButton) {
        delegate?.StartView(self, didTapTipButton: button)
    }
    
    @objc func didTapCalculateButton(_ button: UIButton) {
        delegate?.StartView(self, didTapCalculateButton: button)
    }
    
    @objc func didTapStepper(_ stepper: UIStepper) {
        delegate?.StartView(self, didTapStepper: stepper)
    }
}
