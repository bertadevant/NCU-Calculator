//
//  CalculatorProtocol.swift
//  Calculator
//
//  Created by Berta Devant on 19/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import Foundation

protocol CalculatorDisplayer {
    func setCalculator(calculator: Calculator)
    func setNewResults(results: Double)
    func attachListener(listener: CalculatorActionListener)
    func detachListener()
}

struct CalculatorActionListener {
    let operationAction: (Operation) -> Void
    let inputAction: (String) -> Void
}

