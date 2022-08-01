//
//  Mocks.swift
//  JahezTests
//
//  Created by Mahmoud Salaheldin on 01/08/2022.
//

import Foundation


class MockSuccessInteractor: RestaurantsInteractorProtocol {
    var presenter: RestaurantsInteractorOutputProtocol?
    
    func getRestaurants() {
        presenter?.RestaurantsLoadedSuccessfully(restaurants: [Restaurant(id: 1, name: "Jan Burger", description: "Enjoy fast delivery from Jahez. Order now, or schedule your order any time you want", hours: "08:00 AM - 11:00 PM", image: "https://jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com/3.jpg", rating: 8.0, distance: 0.8, hasOffer: true, offer: "true")])
    }
}

class MockFailurInteractor: RestaurantsInteractorProtocol {
   
    var presenter: RestaurantsInteractorOutputProtocol?
    func getRestaurants() {
           presenter?.RestaurantsLoadingFailed(error: MyError.failedToGetUsers)
       }
}

class RestaurantsViewMock: RestaurantsViewProtocol {
    
    var presenter: RestaurantsPresenterProtocol
    init(presenter: RestaurantsPresenterProtocol) {
        self.presenter = presenter
    }
    var dataSuccessed = false
    var errorHappended = false
    
    func reloadData() {
        dataSuccessed = true
    }
    
    func errorInloadingData(errorMessage: String) {
        errorHappended = true
    }
    func startAnimating() {
       
   }

   func stopAnimating() {
       
   }
}
