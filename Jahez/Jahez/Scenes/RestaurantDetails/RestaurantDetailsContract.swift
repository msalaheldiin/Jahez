//
//  RestaurantDetailsContract.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation


// MARK: - View

protocol RestaurantDetailsViewProtocol: AnyObject {
    var presenter: RestaurantDetailsPresenterProtocol {get set}
    func populateUI(restaurantDetailsViewUIModel: RestaurantDetailsViewUIModel)
}

// MARK: - Presenter

protocol RestaurantDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor

protocol RestaurantDetailsInteractorProtocol: AnyObject {
    var presenter: RestaurantDetailsInteractorOutputProtocol? {get set}
}

// MARK: - Interactor Output

protocol RestaurantDetailsInteractorOutputProtocol: AnyObject {
}

// MARK: - Router

protocol RestaurantDetailsCoordinatorProtocol {
}
