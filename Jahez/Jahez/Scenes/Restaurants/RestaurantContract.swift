//
//  RestaurantContract.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation


// MARK: - View
protocol RestaurantsViewProtocol: AnyObject {
    var presenter: RestaurantsPresenterProtocol {get set}
    func reloadData()
    func errorInloadingData(errorMessage: String)
    func startAnimating()
    func stopAnimating()
}

// MARK: - Presenter
protocol RestaurantsPresenterProtocol: AnyObject {
    func viewDidLoad()
    var numberOfItems: Int { get }
    func configure(restaurantCell cell: RestaurantCellViewProtocol, forIndex indexPath: IndexPath)
    func didSelectRowAt(forIndex indexPath: IndexPath)
    func sortByDistanceTapped()
    func sortByRatingTapped()
    func sortByOfferTapped()
}

// MARK: - Interactor
protocol RestaurantsInteractorProtocol: AnyObject {
    var presenter: RestaurantsInteractorOutputProtocol? {get set}
    func getRestaurants()
}

// MARK: - Interactor Output
protocol RestaurantsInteractorOutputProtocol: AnyObject {
    func RestaurantsLoadedSuccessfully(restaurants: [Restaurant])
    func RestaurantsLoadingFailed(error: Error)
}

// MARK: - Router
protocol RestaurantsCoordinatorProtocol {
    func navigateRestaurantsWeatherDetails(restaurantsDetails: RestaurantDetailsViewUIModel)
 }

// MARK: - RestaurantCellViewProtocol
protocol RestaurantCellViewProtocol: AnyObject {
    func setItem(_ restaurant: RestaurantViewUIModel)
 }
