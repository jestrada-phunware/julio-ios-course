//
//  Model.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/15/17.
//  Copyright © 2017 jestrada. All rights reserved.
//

import Foundation

class Model {

    var taxRate = 0.00
    var subtotalFromTextField = "0.00"

//    private var subtotalAsDecimal: NSDecimalNumber {
//        return NSDecimalNumber(string: subtotalFromTextField)
//    }
//
//    private var taxRateAsDecimal: NSDecimalNumber {
//        return NSDecimalNumber(value: taxRate)
//    }
//
//    var taxAmount: NSDecimalNumber {
//        return subtotalAsDecimal.multiplying(by: taxRateAsDecimal)
//    }
//
//    var totalAmount: NSDecimalNumber {
//        return subtotalAsDecimal.adding(taxAmount)
//    }
    
    func calculateTaxRate(_ taxRate: Double, enteredAmount amount: String) -> Double? {
        self.taxRate = taxRate
        self.subtotalFromTextField = amount
        let tax = taxRate
        guard let amountDouble = Double(amount) else { return 0.00 }
        let total = amountDouble * Double(tax) + amountDouble
        
        return total
    }
    

}
