//
//  CriptoCurrencyHistoricalResponse.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 07/04/21.
//

import Foundation
import Core

public struct CriptoCurrencyHistoricalResponse: Decodable {
    public let bpi: [Date: Double]

    public init(bpi: [Date: Double]) {
        self.bpi = bpi
    }

    enum CodingKeys: String, CodingKey {
        case bpi
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let bpi = try values.decode([String: Double].self, forKey: .bpi)
        var convertedBpi: [Date: Double] = [:]
        for (key, value) in bpi {
            guard let date = key.toDate(format: "yyyy-MM-dd") else { break }
            convertedBpi[date] = value
        }
        self.bpi = convertedBpi
    }
}
