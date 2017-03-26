//
//  ServicesAssembly.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

protocol ServicesAssembly: class {
    func citiesProvider() -> CitiesProvider
    func weatherService() -> WeatherService
    func applicationInfoProvider() -> ApplicationInfoProvider
}
