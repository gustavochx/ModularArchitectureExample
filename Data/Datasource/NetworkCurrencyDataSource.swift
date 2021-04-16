//
//  NetworkCurrencyDataSource.swift
//  Data
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation
import Service

public final class NetworkCurrencyDataSource {

    private let queue: DispatchQueue
    private let request: HttpRequesting

    //MARK: - Life cycle
    public init(queue: DispatchQueue = DispatchQueue.main, requester: HttpRequesting) {
        self.queue = queue
        self.request = requester
    }
}

extension NetworkCurrencyDataSource: CurrencyDataSource {

    public func list(base: CurrencyResponse, completionHandler: @escaping (Result<Bool, RequestError>) -> Void) {
        request.request(with: CurrencyRateContext.rate(base)) { [weak self] result in
            self?.queue.async {
                completionHandler(result)
            }
        }
    }

    public func currency(completionHandler: @escaping (Result<Void, RequestError>) -> Void) {
        self.queue.async {
            completionHandler(.success(()))
        }
    }

}
