//
//  ChooseCalculatorView.swift
//  Calculator
//
//  Created by Berta Devant on 20/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import UIKit

class ChooseCalculatorView: UIView {
    
    private let basicCalculatorButton = UIButton()
    private let scientificCalculatorButton = UIButton()
    private let randomCalculatorButton = UIButton()

    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpView() {
        basicCalculatorButton.setTitle("Basic", for: .normal)
        addSubview(basicCalculatorButton)
        basicCalculatorButton.translatesAutoresizingMaskIntoConstraints = false
        basicCalculatorButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        basicCalculatorButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

}
