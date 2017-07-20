//
//  CalculatorView.swift
//  Calculator
//
//  Created by Berta Devant on 19/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import UIKit

class CalculatorView: UIView, CalculatorDisplayer {

    private let calculatorAdapter = CalculatorAdapter()
    private let operationKeys = [OperationType.Sum, OperationType.Minus, OperationType.Multiply, OperationType.Divide, OperationType.Equals]

    private let titleLabel = UILabel()
    private let resultLabel = UILabel()
    private let inputKeyView = UIView()
    private let operationView = UIView()
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        resultLabel.text = "0"
        resultLabel.backgroundColor = .gray
        resultLabel.textColor = .white
        addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(inputKeyView)
        inputKeyView.translatesAutoresizingMaskIntoConstraints = false
        inputKeyView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        inputKeyView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        inputKeyView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65).isActive = true
        
        addSubview(operationView)
        operationView.translatesAutoresizingMaskIntoConstraints = false
        operationView.topAnchor.constraint(equalTo: inputKeyView.topAnchor).isActive = true
        operationView.leadingAnchor.constraint(equalTo: inputKeyView.trailingAnchor).isActive = true
        operationView.bottomAnchor.constraint(equalTo: inputKeyView.bottomAnchor).isActive = true
        
    }

    func setCalculator(calculator: Calculator) {
        
        titleLabel.text = calculator.calculatorType
        for num in calculator.inputKeys {
            let key = UIButton()
            key.setTitle(num, for: .normal)
            key.setTitleColor(KeyStyle.inputKeyStyle.titleColor, for: .normal)
            key.backgroundColor = KeyStyle.inputKeyStyle.backgroundColor
            key.addTarget(self, action: #selector(inputKeyAction(_:)), for: .touchUpInside)
            
        }
        
        for operation in operationKeys {
            let key = UIButton()
            key.setTitleColor(KeyStyle.operationKey.titleColor, for: .normal)
            key.backgroundColor = KeyStyle.operationKey.backgroundColor
            key.setTitle(operation.rawValue, for: .normal)
            key.addTarget(self, action: #selector(operationKeyAction(_:)), for: .touchUpInside)
        }
    }
    
    func attachListener(listener: CalculatorActionListener) {
        calculatorAdapter.attachListener(listener: listener)
    }
    
    func detachListener() {
        calculatorAdapter.detachListener()
    }
    
    func setNewResults(results: Double) {
        resultLabel.text = String(results)
    }
    
    func operationKeyAction(_ sender: UIButton) {
        guard let newOperation = sender.titleLabel?.text else { return }
        guard let numberEntered = resultLabel.text else { return }
        calculatorAdapter.operationKeySelected(operationString: newOperation, value: numberEntered)
    }
    
    func inputKeyAction(_ sender: UIButton) {
        
        guard let newInput = sender.titleLabel?.text else { return }
        
        if let previousInput = resultLabel.text { resultLabel.text = previousInput + newInput }
        else { resultLabel.text = newInput }
    }
    
    
}
