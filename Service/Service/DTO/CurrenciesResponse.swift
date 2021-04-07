//
//  CurrenciesResponse.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation

public struct CurrencieResponse: Decodable {
    public let rates: [CurrencyEnum: Double]

    public init(rates: [CurrencyEnum: Double]) {
        self.rates = rates
    }

    enum CodingKeys: String, CodingKey {
        case rates
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rates = try values.decode([String: Double].self, forKey: .rates)
        var convertedRates: [CurrencyEnum: Double] = [:]
        for (key, value) in rates {
            guard let currency = CurrencyEnum(rawValue: key) else {
                break
            }
            convertedRates[currency] = value
        }
        self.rates = convertedRates
    }
}
