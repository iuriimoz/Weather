//
//  MainStoryAssembly.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


protocol MainStoryAssembly: AbstractStoryAssembly {
    func initialScren() -> UIViewController
    
    func citiesViewController() -> CitiesViewController
    func currentWeatherViewController(city: City) -> CurrentWeatherViewController
}
