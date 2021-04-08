//
//  CurrenciesResponse.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation

public struct CurrencieResponse: Decodable {
    public let rates: [CurrencyResponse: Double]

    public init(rates: [CurrencyResponse: Double]) {
        self.rates = rates
    }

    enum CodingKeys: String, CodingKey {
        case rates
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rates = try values.decode([String: Double].self, forKey: .rates)
        var convertedRates: [CurrencyResponse: Double] = [:]
        for (key, value) in rates {
            guard let currency = CurrencyResponse(rawValue: key) else {
                break
            }
            convertedRates[currency] = value
        }
        self.rates = convertedRates
    }
}
