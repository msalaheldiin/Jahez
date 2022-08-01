//
//  File.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import Foundation

class RestaurantsInteractor: RestaurantsInteractorProtocol {
   
    // MARK: - Variables
    
    weak var presenter: RestaurantsInteractorOutputProtocol?
    
    func getRestaurants(){
        Task {
            let result  =  await NetworkManager.shared.fetchData(withUrlRequest: URL.init(string: AppURLS.restaurants)) as Result<[Restaurant],Error>
            switch result {
            case .success(let restaurants):
                presenter?.RestaurantsLoadedSuccessfully(restaurants: restaurants)
            case .failure(let error):
                presenter?.RestaurantsLoadingFailed(error: error)
            }
        }
    }
}
