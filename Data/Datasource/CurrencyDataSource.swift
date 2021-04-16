//
//  CurrencyDataSource.swift
//  Data
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation
import Service


public protocol CurrencyDataSource {
    func list(base: CurrencyResponse, completionHandler: @escaping (Result<Bool, RequestError>) -> Void)
    func currency(completionHandler: @escaping (Result<Void, RequestError>) -> Void)
}













