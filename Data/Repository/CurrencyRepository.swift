//
//  CurrencyRepository.swift
//  Data
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation
import Service
import Domain

public protocol CurrencyRepositoring: AnyObject {
    func fetchList(completionHandler: @escaping (Result<Bool, RequestError>) -> Void)
    func fetchCurrency(completionHandler: @escaping (Result<Bool, RequestError>) -> Void)
}

public final class CurrencyRepository {

    private let dataSource: CurrencyDataSource

    //MARK: - Life cycle
    public init(dataSource: CurrencyDataSource) {
        self.dataSource = dataSource
    }
}

extension CurrencyRepository: CurrencyRepositoring {


    public func fetchList(completionHandler: @escaping (Result<Bool, RequestError>) -> Void) {
        completionHandler(.success(true))
    }

    public func fetchCurrency(completionHandler: @escaping (Result<Bool, RequestError>) -> Void) {
        completionHandler(.success(true))
    }

}

