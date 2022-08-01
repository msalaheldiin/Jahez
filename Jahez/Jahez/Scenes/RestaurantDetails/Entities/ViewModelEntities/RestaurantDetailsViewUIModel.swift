//
//  File.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 31/07/2022.
//

import Foundation

//MARK: - RestaurantDetailsViewUIModel

public struct RestaurantDetailsViewUIModel{
    
    // MARK: - Variables

    private(set) var id: Int
    private(set) var name: String
    private(set) var image: String
    private(set) var description: String
    private(set) var hours: String
    private(set) var rating: Double

    // MARK: - Init
    
    init(restaurant: Restaurant) {
        self.id = restaurant.id ?? 0
        self.name = restaurant.name ?? ""
        self.image = restaurant.image ?? ""
        self.description = restaurant.description ?? ""
        self.hours = restaurant.hours ?? "0"
        self.rating = restaurant.rating ?? 0.0
    }
}
