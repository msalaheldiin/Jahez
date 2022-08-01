//
//  RestaurantDetailsPresenter.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation


class RestaurantDetailsPresenter {
    
    // MARK: - Variables
    
    weak var view: RestaurantDetailsViewProtocol?
    private let interactor: RestaurantDetailsInteractorProtocol
    let wirframe: RestaurantDetailsCoordinatorProtocol
    private var restaurantDetails: RestaurantDetailsViewUIModel
    
    // MARK: - Init
    
    init(interactor: RestaurantDetailsInteractorProtocol,
         wirframe: RestaurantDetailsCoordinatorProtocol,
         restaurantDetails: RestaurantDetailsViewUIModel) {
        self.interactor = interactor
        self.wirframe = wirframe
        self.restaurantDetails = restaurantDetails
    }
}

// MARK: - RestaurantDetailsPresenterProtocol

extension RestaurantDetailsPresenter: RestaurantDetailsPresenterProtocol {
    func viewDidLoad() {
         view?.populateUI(restaurantDetailsViewUIModel: restaurantDetails)
    }
}

// MARK: - RestaurantDetailsInteractorOutputProtocol

extension RestaurantDetailsPresenter : RestaurantDetailsInteractorOutputProtocol {
 
}
