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
        calculateSalesTax()
    }

    // MARK: - Functions
    func calculateSalesTax() {

        guard let subtotal = subtotalTextField.text, !subtotal.isEmpty else {
            print("Subtotal is empty")
            totalLabel.text = "Total: "
            return
        }
        guard subtotal == subtotal.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: ".") else {
            totalLabel.text = "Please enter valid number"
            return
        }

        let stateIndex = statesSegmentedControl.selectedSegmentIndex
        let taxRate = stateTaxRate[stateIndex]

        guard let totalAmount = model.calculateTaxRate(taxRate, enteredAmount: subtotal) else {
            return
        }

        updateTotalLabel(total: totalAmount)
//        print(model.taxRate)
    }

    func updateTotalLabel(total: Double?) {

        if let total = total {
            totalLabel.text = "Total: $\(total)"
        }
    }

    func customizeViews() {
        statesSegmentedControl.removeBorders()
    }
}
