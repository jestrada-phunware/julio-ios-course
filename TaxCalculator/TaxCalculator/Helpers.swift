//
//  Helpers.swift
//  TaxCalculator
//
//  Created by Julio Estrada on 8/20/17.
//  Copyright © 2017 jestrada. All rights reserved.
//

import UIKit

enum TextFieldError: Error {
    case emptyValue(String)
}

extension NSNumber {
    func formatter(number: NSNumber) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let numberAsCurrency = formatter.string(from: number)
        return numberAsCurrency
    }
}

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .black), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: .clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }

    private func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 10.00, height: 40.00)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
