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

    // MARK: - Init
    
    init(restaurant: Restaurant) {
        self.id = restaurant.id ?? 0
        self.name = restaurant.name ?? ""
        self.image = restaurant.image ?? ""
    }
}
