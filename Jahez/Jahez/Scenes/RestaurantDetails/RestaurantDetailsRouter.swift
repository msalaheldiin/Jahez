//
//  RestaurantDetailsCoordinator.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation
import UIKit

class RestaurantDetailsCoordinator: RestaurantDetailsCoordinatorProtocol {

// MARK: - Variables

let navigationController: UINavigationController

// MARK: - Init

init(navigationController: UINavigationController) {
    self.navigationController = navigationController
}

func start(restaurantDetails: RestaurantDetailsViewUIModel) {
    let interactor = RestaurantDetailsInteractor()
    let presenter = RestaurantDetailsPresenter.init(interactor: interactor, wirframe: self, restaurantDetails: restaurantDetails)
    interactor.presenter = presenter
    let vc = RestaurantDetailsViewController(presenter: presenter)
    presenter.view = vc
    navigationController.pushViewController(vc, animated: true)
}
}
