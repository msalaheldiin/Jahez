//
//  RestaurantDetailsViewController.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
 
    // MARK: - Outlets
    
    @IBOutlet weak var restIV: UIImageView!
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var hourTextLabel: UILabel!
    @IBOutlet weak var rateTextLabel: UILabel!
    
    // MARK: - Variables
    
    var presenter: RestaurantDetailsPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: RestaurantDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName:"\(RestaurantDetailsViewController.self)", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
     }
}

// MARK: - Setup UI

extension RestaurantDetailsViewController {
    private func setupUI() {
        setupNavigationBar()
        
    }
    
    private func setupNavigationBar() {
        title = "Restaurant Details"
      }
}

// MARK: - RestaurantDetailsViewProtocol

extension RestaurantDetailsViewController: RestaurantDetailsViewProtocol {
    
    func populateUI(restaurantDetailsViewUIModel: RestaurantDetailsViewUIModel) {
        restIV.downloaded(from: restaurantDetailsViewUIModel.image)
        nameTextLabel.text = restaurantDetailsViewUIModel.name
        descriptionTextLabel.text = restaurantDetailsViewUIModel.description
        hourTextLabel.text = restaurantDetailsViewUIModel.hours
        rateTextLabel.text = "\(restaurantDetailsViewUIModel.rating)"
    }

}
