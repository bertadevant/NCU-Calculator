//
//  CalculatorAdapter.swift
//  Calculator
//
//  Created by Berta Devant on 19/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import Foundation

class CalculatorAdapter {
    
    private var listener: CalculatorActionListener?
    private var leftSideValue: Double?
    private var operationForValues: OperationType?
    
    func attachListener(listener: CalculatorActionListener) {
        self.listener = listener
    }

    func detachListener() {
        listener = nil
    }
    
    func operationKeySelected(operationString: String, value: String) {
        
        guard let newValue = Double(value) else { return }
        
        if operationString == OperationType.Equals.rawValue {
            guard let operationForValues = self.operationForValues else { return }
            let operation = Operation(leftSideValue: leftSideValue ?? 0, rightSideValue: newValue, operationType: operationForValues)
            listener?.operationAction(operation)
            return
        }

        leftSideValue = newValue
        switch operationString {
        case OperationType.Sum.rawValue:
            operationForValues = OperationType.Sum
        case OperationType.Minus.rawValue:
            operationForValues = OperationType.Minus
        case OperationType.Multiply.rawValue:
            operationForValues = OperationType.Multiply
        case OperationType.Divide.rawValue:
            operationForValues = OperationType.Divide
        default: break
        }
    }
    
    func inputKeySelected(input: String) {
        listener?.inputAction(input)
    }
}
