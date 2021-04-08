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
    init(queue: DispatchQueue, request: HttpRequesting) {
        self.queue = queue
        self.request = request
    }
}

extension NetworkCurrencyDataSource: CurrencyDataSource {

    func list() {

    }

    func currency() {

    }

}
