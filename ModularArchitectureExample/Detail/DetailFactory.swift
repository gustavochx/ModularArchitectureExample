//
//  DetailFactory.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit
import Domain

struct CriptoCurrency {
    let rates: [Currency: Double]
}

final class DetailFactory {
    static func make(criptoCurrency: CriptoCurrency, currencies: Currencies, date: Date) -> UIViewController {
        return UIViewController()
    }
}
