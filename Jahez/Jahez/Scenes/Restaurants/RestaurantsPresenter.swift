//
//  Filee.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation

class RestaurantsPresenter  {
    
    // MARK: - Variables
    
    weak var view: RestaurantsViewProtocol?
    private let interactor: RestaurantsInteractorProtocol
    let wirframe: RestaurantsCoordinatorProtocol
    private var restaurantsItems = [RestaurantViewUIModel]()
    private var restuarntsList = [Restaurant]()
    
    // MARK: - Init
    
    init(interactor: RestaurantsInteractorProtocol,
         wirframe: RestaurantsCoordinatorProtocol) {
        self.interactor = interactor
        self.wirframe = wirframe
    }
}


// MARK: - RestaurantsPresenterProtocol

extension RestaurantsPresenter: RestaurantsPresenterProtocol {
 
    func viewDidLoad() {
        view?.startAnimating()
        interactor.getRestaurants()
    }
    var numberOfItems: Int {
        return restaurantsItems.count
    }
    
    func configure(restaurantCell cell: RestaurantCellViewProtocol, forIndex indexPath: IndexPath) {
        let model = restaurantsItems[indexPath.row]
        cell.setItem(model)
    }
    
    func didSelectRowAt(forIndex indexPath: IndexPath) {
        let id = restaurantsItems[indexPath.row].id
        guard let resturantItemDetails = restuarntsList.first(where: {$0.id == id}).map({RestaurantDetailsViewUIModel(restaurant: $0)}) else { return }
        wirframe.navigateRestaurantsWeatherDetails(restaurantsDetails: resturantItemDetails)
    }
    
    func sortByDistanceTapped() {
        restaurantsItems.sort(by: { $0.distance < $1.distance })
        view?.reloadData()
    }
    
    func sortByRatingTapped() {
        restaurantsItems.sort(by: { $0.rating > $1.distance })
        view?.reloadData()
    }
    
    func sortByOfferTapped() {
        restaurantsItems.sort(by: { $0.hasOffer && !$1.hasOffer})
        view?.reloadData()
    }
}

// MARK: - RestaurantsInteractorOutputProtocol

extension RestaurantsPresenter : RestaurantsInteractorOutputProtocol {
    func RestaurantsLoadedSuccessfully(restaurants: [Restaurant]) {
        
        restuarntsList = restaurants
        let sortedContent = restaurants.sorted(by: {$0.rating ?? 0.0  > $1.rating ?? 0.0 })
        restaurantsItems.append(contentsOf: sortedContent.map({RestaurantViewUIModel(restaurant: $0)}))
        view?.stopAnimating()
        view?.reloadData()
    }
    
    func RestaurantsLoadingFailed(error: Error) {
        view?.stopAnimating()
        view?.errorInloadingData(errorMessage: error.localizedDescription)
    }
}
