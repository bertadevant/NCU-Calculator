//
//  ChooseCalculatorViewController.swift
//  Calculator
//
//  Created by Berta Devant on 20/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import UIKit

class ChooseCalculatorViewController: UIViewController {

    private let chooseCalculatorView = ChooseCalculatorView()
    
    override func loadView() {
        view = UIView()
        
        view.addSubview(chooseCalculatorView)
        
        chooseCalculatorView.translatesAutoresizingMaskIntoConstraints = false
        chooseCalculatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        chooseCalculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        chooseCalculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        chooseCalculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    


}
