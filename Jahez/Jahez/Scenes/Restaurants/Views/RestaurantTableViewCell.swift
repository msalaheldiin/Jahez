//
//  RestaurantTableViewCell.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 31/07/2022.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restIV: UIImageView!
    // MARK: - Variables

    static let identifier = "\(RestaurantTableViewCell.self)"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

// MARK: - Extensions

extension RestaurantTableViewCell: RestaurantCellViewProtocol {
    func setItem(_ restaurant: RestaurantViewUIModel) {
        restIV.downloaded(from: restaurant.image)
        restName.text = restaurant.name
    }
    
}
