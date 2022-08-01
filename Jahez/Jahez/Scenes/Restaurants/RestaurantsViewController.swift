//
//  RestaurantsViewController.swift
//  Jahez
//
//  Created by Mahmoud Salaheldin on 29/07/2022.
//

import UIKit
 
class RestaurantsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Variables

    var presenter: RestaurantsPresenterProtocol
 
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    lazy var activityIndicator: UIActivityIndicatorView = {
//
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//        return activityIndicator
//    }()
    
    // MARK: - Init
    
    init(presenter: RestaurantsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName:"\(RestaurantsViewController.self)", bundle: nil)
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


// MARK: -  Extensions

extension RestaurantsViewController : RestaurantsViewProtocol {
    
    private func setupUI(){
        setupNavigationBar()
         setupTableView()
    }
    
    private func setupNavigationBar() {
        title = "Restaurants"
    }
    
    private func setupTableViewConstraints() {
        
    }
    private func setupTableView(){
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(UINib.init(nibName: RestaurantTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RestaurantTableViewCell.identifier)
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()

        }
    }
    
    func errorInloadingData(errorMessage: String) {
        DispatchQueue.main.async { [weak self] in
            self?.alert(title: "Error", message: errorMessage)
        }
    }
    
    func startAnimating() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
            self?.activityIndicator.isHidden = false
        }
    }
    
    func stopAnimating() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
}


// MARK: - UITableViewDataSource

extension RestaurantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getRestaurantCell(indexPath: indexPath)
    }
    
    private func getRestaurantCell(indexPath: IndexPath) -> RestaurantTableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.identifier, for: indexPath) as? RestaurantTableViewCell else {
            fatalError("RestaurantTableViewCell Cell Not Registered")
        }
        presenter.configure(restaurantCell: cell, forIndex: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension RestaurantsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(forIndex : indexPath)
    }
}