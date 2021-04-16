//
//  HistoricalInteractor.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import Foundation
import Service
import Data


protocol HistoricalInteracting {
    func updateCurrentValue()
    func updateCriptoCurrencyHistoricalList()
    func detailSelection(indexPath: IndexPath)
}

final class HistoricalInteractor {
    
    // MARK: - Variables
    private let service: CurrencyRepositoring?
    private let presenter: HistoricalPresenting
    private var dates: [Date] = []

    // MARK: - Life Cycle
    init(repository: CurrencyRepositoring, presenter: HistoricalPresenting) {
        self.service = repository
        self.presenter = presenter
    }
}

// MARK: - HistoricalInteracting
extension HistoricalInteractor: HistoricalInteracting {

    func updateCurrentValue() {

    }

    func updateCriptoCurrencyHistoricalList() {

    }

    func detailSelection(indexPath: IndexPath) {
        
    }


}
