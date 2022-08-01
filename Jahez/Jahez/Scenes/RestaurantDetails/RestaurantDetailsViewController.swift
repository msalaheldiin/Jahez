//
//  RestaurantDetailsViewController.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    // MARK: - Variables
    
    var presenter: RestaurantDetailsPresenterProtocol
    
    let restaurantIV: UIImageView = {
        let restIV = UIImageView()
        return restIV
    }()
    
    let restaurantName: UILabel = {
        let restName = UILabel()
        restName.adjustsFontSizeToFitWidth = true
        restName.minimumScaleFactor = 0.8
        restName.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)
        return restName
    }()
    
    let restaurantDescription: UILabel = {
        let restDescription = UILabel()
        restDescription.numberOfLines = 0
        return restDescription
    }()
    
    let restaurantHours: UILabel = {
        let restHours = UILabel()
        restHours.setContentCompressionResistancePriority(UILayoutPriority.init(rawValue: 1000), for: .horizontal)

        return restHours
    }()
    
    let restaurantRate: UILabel = {
        let restRate = UILabel()
        return restRate
    }()
    
    
    let nameAndDescriptionStackView: UIStackView = {
        let nameDescStackView = UIStackView()
        nameDescStackView.axis  = NSLayoutConstraint.Axis.horizontal
        nameDescStackView.distribution  = UIStackView.Distribution.fillProportionally
        nameDescStackView.alignment = UIStackView.Alignment.fill
        nameDescStackView.spacing   = 8.0
        return nameDescStackView
    }()
    
    let hoursAndRateStackView: UIStackView = {
        let hoursrateStackView = UIStackView()
        hoursrateStackView.axis  = NSLayoutConstraint.Axis.horizontal
        hoursrateStackView.distribution  = UIStackView.Distribution.fillProportionally
        hoursrateStackView.alignment = UIStackView.Alignment.fill
        hoursrateStackView.spacing   = 8.0
        return hoursrateStackView
    }()
    
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
        setupRestaurantIV()
        setupStackViews()
    }
    
    private func setupNavigationBar() {
        title = "Restaurant Details"
    }
    
    private func setupRestaurantIV() {
        view.addSubview(restaurantIV)
        restaurantIV.anchor( view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: 375, heightConstant: 180)
    }
    
    private func setupStackViews(){
        view.addSubview(nameAndDescriptionStackView)
        view.addSubview(hoursAndRateStackView)
        nameAndDescriptionStackView.addArrangedSubview(restaurantName)
        nameAndDescriptionStackView.addArrangedSubview(restaurantDescription)
        hoursAndRateStackView.addArrangedSubview(restaurantHours)
        hoursAndRateStackView.addArrangedSubview(restaurantRate)
        
    }
    
    private func setupStackViewsConstaints() {
        nameAndDescriptionStackView.anchor(restaurantIV.bottomAnchor, left: view.leftAnchor, bottom: hoursAndRateStackView.topAnchor, right: view.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 8, rightConstant: 16, widthConstant: nameAndDescriptionStackView.bounds.size.width, heightConstant: nameAndDescriptionStackView.bounds.size.height)
        
        hoursAndRateStackView.anchor(nameAndDescriptionStackView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: hoursAndRateStackView.bounds.size.width, heightConstant: hoursAndRateStackView.bounds.size.height)
    }
    
}

// MARK: - RestaurantDetailsViewProtocol

extension RestaurantDetailsViewController: RestaurantDetailsViewProtocol {
    
    func populateUI(restaurantDetailsViewUIModel: RestaurantDetailsViewUIModel) {
        restaurantIV.downloaded(from: restaurantDetailsViewUIModel.image)
        restaurantName.text = "Name: \(restaurantDetailsViewUIModel.name)"
        restaurantDescription.text = "Description: \(restaurantDetailsViewUIModel.description)"
        restaurantHours.text = "Hours: \(restaurantDetailsViewUIModel.hours)"
        restaurantRate.text = "Rate: \(restaurantDetailsViewUIModel.rating)"
        setupStackViewsConstaints()
    }
}
