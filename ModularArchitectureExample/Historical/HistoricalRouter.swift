//
//  HistoricalRouter.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit
import Service

protocol HistoricalRouting {
//    func routeDetail(with criptoCurrency: CriptoCurrency, currencies: Currencies, date: Date)
}

final class HistoricalRouter {
    // MARK: - Variables
    weak var viewController: UIViewController?
}

// MARK: - HistoricalRouting
extension HistoricalRouter: HistoricalRouting {
//    func routeDetail(with criptoCurrency: CriptoCurrency, currencies: Currencies, date: Date) {
//        let detailController = DetailFactory.make(criptoCurrency: criptoCurrency, currencies: currencies, date: date)
//        viewController?.navigationController?.pushViewController(detailController, animated: true)
//    }
}
