//
//  ViewController.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/15/17.
//  Copyright © 2017 jestrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let model = Model()
    let stateTaxRate = [0.075, 0.0925, 0.045, 0.0825]

    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalTextField.becomeFirstResponder()
        customizeViews()
    }

    // MARK: - Outlets
    @IBOutlet var subtotalTextField: UITextField!
    @IBOutlet var statesSegmentedControl: UISegmentedControl!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var totalLabel: UILabel!

    // MARK: - Interactions
    @IBAction func tapButton(_ sender: UIButton) {
        subtotalTextField.resignFirstResponder()

        if let subtotal = subtotalTextField.text, subtotal == "" {
            totalLabel.text = "Total: "
        } else {
            calculateSalesTax()
        }
    }

    // MARK: - Functions
    func calculateSalesTax() {
        guard let subtotal = subtotalTextField.text, subtotal != "" else {
            print("Subtotal is empty")
            return
        }
        let stateIndex = statesSegmentedControl.selectedSegmentIndex
        model.taxRate = stateTaxRate[stateIndex]
        model.subtotalFromTextField = subtotal

        let totalAmount = model.totalAmount
//        let handler = NSDecimalNumberHandler(roundingMode: .plain, scale: 2, raiseOnExactness: true, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: false)
//        let roundedTotal = totalAmount.rounding(accordingToBehavior: handler)
        let roundedTotal = formatter(number: totalAmount)
        updateTotalLabel(total: roundedTotal)
    }

    func updateTotalLabel(total: String?) {

        if let total = total {
            totalLabel.text = total
        }
    }

    func customizeViews() {
        statesSegmentedControl.removeBorders()
    }
}
