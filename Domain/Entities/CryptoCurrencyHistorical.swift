//
//  CryptoCurrencyHistorical.swift
//  Domain
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation


public struct CryptoCurrencyHistorical {

    public let bpi: [Date: Double]

    public init(newBpi: [Date: Double]) {
        self.bpi = newBpi
    }

}
