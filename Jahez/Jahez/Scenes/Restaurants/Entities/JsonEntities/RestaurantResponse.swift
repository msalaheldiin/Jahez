//
//  File.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 31/07/2022.
//

import Foundation

struct Restaurant: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let hours: String?
    let image: String?
    let rating: Double?
    let distance: Double?
    let hasOffer: Bool?
    let offer: String?
}

