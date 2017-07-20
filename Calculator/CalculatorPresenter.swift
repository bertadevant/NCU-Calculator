//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Berta Devant on 19/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import Foundation

class CalculatorPresenter {
    private let displayer: CalculatorDisplayer
    private let calculator: Calculator
    
    init(displayer: CalculatorDisplayer, calculator: Calculator) {
        self.displayer = displayer
        self.calculator = calculator
    }
    
    func presentCalculator() {
        displayer.setCalculator(calculator: calculator)
        displayer.attachListener(listener: newListener())
    }
    
    private func newListener() -> CalculatorActionListener {
        return CalculatorActionListener(
            operationAction: { [displayer] operation in
                var result: Double = 0
                switch operation.operationType {
                case .Sum: result = operation.leftSideValue + operation.rightSideValue
                case .Minus: result = operation.leftSideValue - operation.rightSideValue
                case .Multiply: result = operation.leftSideValue * operation.rightSideValue
                case .Divide: result = operation.leftSideValue / operation.rightSideValue
                case .Equals: break
                }
                displayer.setNewResults(results: result)
            }, inputAction: { [displayer] input in
                //TODO accept non numbered inputs
                guard let number = Double(input) else { return }
                displayer.setNewResults(results: number)
        })
    }
    
    func stopPresenting() {
        displayer.detachListener()
    }

}
