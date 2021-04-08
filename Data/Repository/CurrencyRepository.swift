//
//  CurrencyRepository.swift
//  Data
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation
import Service
import Domain


protocol CurrencyRepositoring {
    func didFetchList()
    func didFetchCurrency()
}

final class CurrencyRepository {

    private let dataSource: CurrencyDataSource

    //MARK: - Life cycle
    init(dataSource: CurrencyDataSource) {
        self.dataSource = dataSource
        self.dataSource.sourcing = self
    }

}

extension CurrencyRepository: CurrencyRepositoring {

    func didFetchList() {

    }

    func didFetchCurrency() {

    }

}

