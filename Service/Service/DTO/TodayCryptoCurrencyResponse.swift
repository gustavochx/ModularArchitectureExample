//
//  TodayCryptoCurrencyResponse.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation


public struct TodayCriptoCurrencyResponse: Decodable {
    public let bpi: BpiResponse

    public init(bpi: BpiResponse) {
        self.bpi = bpi
    }
}

public struct BpiResponse: Decodable {
    public let usd, gbp, eur: CriptoCurrencyRateResponse

    public init(usd: CriptoCurrencyRateResponse, gbp: CriptoCurrencyRateResponse, eur: CriptoCurrencyRateResponse) {
        self.usd = usd
        self.gbp = gbp
        self.eur = eur
    }

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

public struct CriptoCurrencyRateResponse: Decodable {
    public let rateFloat: Double

    public init(rateFloat: Double) {
        self.rateFloat = rateFloat
    }

    enum CodingKeys: String, CodingKey {
        case rateFloat = "rate_float"
    }
}
