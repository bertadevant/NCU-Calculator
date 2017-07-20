//
//  CalculatorConstants.swift
//  Calculator
//
//  Created by Berta Devant on 20/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let basicCalulatorNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
    static let basicOperations = [OperationType.Sum, OperationType.Minus, OperationType.Multiply, OperationType.Divide, OperationType.Equals]
    
}

struct KeyStyle {
    var titleColor: UIColor
    var backgroundColor: UIColor
}

extension KeyStyle {
    
    static var inputKeyStyle: KeyStyle {
        return KeyStyle(titleColor: .gray, backgroundColor: .white)
    }
    
    static var operationKey: KeyStyle {
        return KeyStyle(titleColor: .white, backgroundColor: .gray)
    }
}
