//
//  CurrencyRateContext.swift
//  Service
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import Foundation

public enum CurrencyRateContext: HttpRequestSetup {
    case rate(CurrencyResponse)

    public var url: String {
        switch self {
            case .rate:
                return "https://api.exchangeratesapi.io/latest?"
        }
    }

    public var httpMethod: HttpRequestMethod {
        switch self {
            case .rate:
                return .get
        }
    }

    public var parameters: [String : Encodable]? {
        switch self {
            case let .rate(base):
                return ["base": base.rawValue]
        }
    }
}
