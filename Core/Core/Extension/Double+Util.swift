//
//  Double+Util.swift
//  Core
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import Foundation

public extension Double {
    /// Convert the value to a currency value.
    /// - Parameter locale: The currency's locale.
    /// - Parameter hasCurrencySymbol: Define if the currency symbol will appear and the punctuation structure.
    func convert(withLocale locale: String, hasCurrencySymbol: Bool = true) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: locale)
        formatter.numberStyle = .currency
        if !hasCurrencySymbol {
            formatter.locale = Locale(identifier: "de_DE")
            formatter.currencySymbol = ""
        }
        return formatter.string(from: self as NSNumber)
    }
}
