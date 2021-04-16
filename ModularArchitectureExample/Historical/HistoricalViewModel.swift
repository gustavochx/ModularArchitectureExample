//
//  HistoricalViewModel.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import Foundation
import Service
import Core
import Domain
import Data

protocol HistoricalPresenting {
    func presentCriptoTodayValue(_ today: (Date, Double))
    func presentCriptoCurrencyHistorical(_ historical: [Date: Double])
    func presentError(message: String)
//    func presentDetail(with criptoCurrency: CriptoCurrency, currencies: Currencies, date: Date)
}

final class HistoricalPresenter {
    // MARK: - Variables
    weak var viewController: HistoricalDisplay?
    private var router: HistoricalRouting

    // MARK: - Life Cycle
    init(router: HistoricalRouting) {
        self.router = router
    }
}

// MARK: - HistoricalPresenting
extension HistoricalPresenter: HistoricalPresenting {

    // MARK: - TodayValue
    func presentCriptoTodayValue(_ today: (Date, Double)) {
        let date = today.0.toString(format: "dd/MM/yyyy")
        let value = today.1.convert(withLocale: Currency.eur.locale) ?? "-"
        viewController?.displayTodayValue(today: (date, value))
    }

    // MARK: - Historical
    func presentCriptoCurrencyHistorical(_ historical: [Date: Double]) {
        let formattedHistorical = formatValues(historical: historical)
        viewController?.displayHistorical(list: formattedHistorical)
    }

    private func formatValues(historical: [Date: Double]) -> [(String, String)] {
        let arrayValues = historical.map({($0, $1)}).sorted(by: { first, second in
            return first.0.compare(second.0) == .orderedDescending
        })

        let formattedValues = arrayValues.compactMap { (key, value) -> (String, String)? in
            let formattedDate = key.toString(format: "dd/MM/yyyy")
            guard let formatedValue = value.convert(withLocale: Currency.eur.locale)else {
                return nil
            }
            return (formattedDate, formatedValue)
        }
        return formattedValues
    }

    // MARK: - Error
    func presentError(message: String) {
        viewController?.displayError(message: message)
    }

}
