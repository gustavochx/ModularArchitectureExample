//
//  Bpi.swift
//  Domain
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation


public struct Bpi {

    public let usd, gbp, eur: CryptoCurrencyRate

    public init(newUsd: CryptoCurrencyRate, newGbp: CryptoCurrencyRate, newEur: CryptoCurrencyRate) {
        self.usd = newUsd
        self.gbp = newGbp
        self.eur = newEur
    }

}
