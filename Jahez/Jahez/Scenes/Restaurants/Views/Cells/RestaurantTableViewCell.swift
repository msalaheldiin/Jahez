//
//  RestaurantTableViewCell.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 31/07/2022.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // MARK: - Variables

    static let identifier = "\(RestaurantTableViewCell.self)"
    
    let restaurantIV: UIImageView = {
        let restIV = UIImageView()
        return restIV
    }()
    
    let restaurantName: UILabel = {
        let restName = UILabel()
        return restName
    }()
    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - Extensions

extension RestaurantTableViewCell{
    private func setupUI() {
        
        addSubview(restaurantIV)
        restaurantIV.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 80, heightConstant: 80)
        
        addSubview(restaurantName)
        restaurantName.anchor(topAnchor, left: restaurantIV.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        selectionStyle = .none
    }
}


extension RestaurantTableViewCell: RestaurantCellViewProtocol {
    func setItem(_ restaurant: RestaurantViewUIModel) {
        restaurantIV.downloaded(from: restaurant.image)
        restaurantName.text = restaurant.name
    }
}
