//
//  CitiesRouterImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class CitiesRouterImpl: CitiesRouter {
    
    // MARK: DI-properties
    
    weak var mainStoryAssembly: MainStoryAssembly!
    weak var settingsStoryAssembly: SettingsStoryAssembly!
    weak var viewController: UIViewController!
    
    // MARK: CitiesRouter
    
    func showForecast(city: City) {
        let forecastVC = mainStoryAssembly.currentWeatherViewController(city: city)
        forecastVC.city = city
        
        guard let navController = viewController.navigationController else {
            assert(false)
            return
        }
        
        navController.pushViewController(forecastVC, animated: true)
    }
    
    func showSettings() {
        let settingsVC = settingsStoryAssembly.initialScren()
        
        viewController.present(settingsVC, animated: true, completion: nil)
    }
}
