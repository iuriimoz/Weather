//
//  CitiesViewController.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class CitiesViewController: UITableViewController {

    private var cities = [City]()
    private let cellID = "cityCellID"
    
    // MARK: DI-properties
    
    var router: CitiesRouter!
    var citiesProvider: CitiesProvider!
    
    // MARK: UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cities = citiesProvider.cities
        
        title = "Cities"
        navigationItem.rightBarButtonItem = createSettingsButton()
    }
    
    // MARK: Actions
    
    @objc func settingsButtonPressed() {
        router.showSettings()
    }
    
    // MARK: UITableViewDelegate & UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) ??
            createCell()
        
        cell.textLabel?.text = cities[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        
        let city = cities[indexPath.row]
        router.showForecast(city: city)
    }
    
    // MARK: Utility
    
    private func createCell() -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    private func createSettingsButton() -> UIBarButtonItem {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "Gear"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(settingsButtonPressed))
        
        guard let font = UIFont(name: "Helvetica", size: 24) else {
            assert(false)
            return UIBarButtonItem()
        }
        
        let attributes = [NSAttributedStringKey.font : font]
        
        button.setTitleTextAttributes(attributes, for: .normal)

        return button
    }
}
