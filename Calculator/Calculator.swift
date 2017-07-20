//
//  CalculatorType.swift
//  Calculator
//
//  Created by Berta Devant on 19/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import Foundation

struct Calculator {
    var calculatorType: String
    var inputKeys: [String]
}

struct Operation {
    var leftSideValue: Double
    var rightSideValue: Double
    var operationType: OperationType
}

enum OperationType: String {
    case Sum = "+"
    case Minus  = "-"
    case Multiply = "*"
    case Divide = "/"
    case Equals  = "="
}

