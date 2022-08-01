//
//  File.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//


import Foundation
import UIKit

class RestaurantsCoordinator: RestaurantsCoordinatorProtocol {
    
    
    // MARK: - Variables
    
    let navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let interactor = RestaurantsInteractor()
        let presenter = RestaurantsPresenter.init(interactor: interactor, wirframe: self)
        interactor.presenter = presenter
        let vc = RestaurantsViewController(presenter: presenter)
        presenter.view = vc
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateRestaurantsWeatherDetails(restaurantsDetails: RestaurantDetailsViewUIModel){
        RestaurantDetailsCoordinator.init(navigationController: navigationController).start(restaurantDetails: restaurantsDetails)
    }

}
