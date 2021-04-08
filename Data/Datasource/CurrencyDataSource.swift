//
//  CurrencyDataSource.swift
//  Data
//
//  Created by Gustavo Henrique Frota Soares on 08/04/21.
//

import Foundation
import Service

protocol CurrencyDataSource {

    func list()
    func currency()

    weak var sourcing: CurrencyRepositoring? { set }
}













