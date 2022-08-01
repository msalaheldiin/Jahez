//
//  File.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 31/07/2022.
//

import Foundation


//MARK: - RestaurantViewUIModel

public struct RestaurantViewUIModel{
    
    // MARK: - Variables

    private(set) var id: Int
    private(set) var name: String
    private(set) var image: String
    private(set) var distance: Double
    private(set) var hasOffer: Bool
    private(set) var rating: Double


    // MARK: - Init
    
    init(restaurant: Restaurant) {
        self.id = restaurant.id ?? 0
        self.name = restaurant.name ?? ""
        self.image = restaurant.image ?? ""
        self.distance = restaurant.distance ?? 0.0
        self.rating = restaurant.rating ?? 0.0
        self.hasOffer = restaurant.hasOffer ?? false
    }
}
