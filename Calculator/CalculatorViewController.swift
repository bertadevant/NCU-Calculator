//
//  ViewController.swift
//  Calculator
//
//  Created by Berta Devant on 18/07/2017.
//  Copyright © 2017 Berta Devant. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var calculatorPresenter: CalculatorPresenter?
    private let calculatorView = CalculatorView()
    
    init(with calculator: Calculator) {
        super.init(nibName: nil, bundle: nil)
        calculatorPresenter = CalculatorPresenter(displayer: calculatorView,
                                                  calculator: calculator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.addSubview(calculatorView)
        
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        calculatorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorPresenter?.presentCalculator()
    }

    override func viewWillDisappear(_ animated: Bool) {
        calculatorPresenter?.stopPresenting()
        super.viewWillDisappear(animated)
    }

}

