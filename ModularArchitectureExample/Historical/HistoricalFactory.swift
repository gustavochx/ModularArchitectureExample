//
//  HistoricalFactory.swift
//  ModularArchitectureExample
//
//  Created by Gustavo Henrique Frota Soares on 16/04/21.
//

import UIKit
import Service
import Data

public final class HistoricalFactory {
    public static func make() -> UIViewController {
        let router = HistoricalRouter()

        let networkDataSource = NetworkCurrencyDataSource(requester: HttpRequest())
        let repository = CurrencyRepository(dataSource: networkDataSource)
        let presenter = HistoricalPresenter(router: router)
        let interactor = HistoricalInteractor(repository: repository, presenter: presenter)
        let viewController = HistoricalViewController(interactor: interactor)
        router.viewController = viewController
        presenter.viewController = viewController
        return UINavigationController(rootViewController: viewController)
    }
}
