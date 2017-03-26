//
//  MainStoryAssemblyImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class MainStoryAssemblyImpl: MainStoryAssembly {
    
    // MARK: MainStoryAssembly
    
    weak var servicesAssembly: ServicesAssembly!
    weak var settingsStoryAssembly: SettingsStoryAssembly!
    
    func initialScren() -> UIViewController {
        let citiesVC = citiesViewController()
        
        return UINavigationController(rootViewController: citiesVC)
    }
    
    func citiesViewController() -> CitiesViewController {
        let vc = CitiesViewController()
        let router = CitiesRouterImpl()
        
        vc.citiesProvider = servicesAssembly.citiesProvider()
        vc.router = router
        
        router.viewController = vc
        router.mainStoryAssembly = self
        router.settingsStoryAssembly = settingsStoryAssembly
        
        return vc
    }
    
    func currentWeatherViewController(city: City) -> CurrentWeatherViewController {
        let vc =  CurrentWeatherViewController()
        vc.city = city
        vc.weatherService = servicesAssembly.weatherService()
        
        return vc
    }
}
