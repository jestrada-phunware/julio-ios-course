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

    var subtotalAsDecimal: NSDecimalNumber {
        return NSDecimalNumber(string: subtotalFromTextField)
    }

    var taxRateAsDecimal: NSDecimalNumber {
        return NSDecimalNumber(value: taxRate)
    }

    var taxAmount: NSDecimalNumber {
        return subtotalAsDecimal.multiplying(by: taxRateAsDecimal)
    }

    var totalAmount: NSDecimalNumber {
        return subtotalAsDecimal.adding(taxAmount)
    }
}
