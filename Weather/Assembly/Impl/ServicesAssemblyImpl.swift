//
//  ServicesAssemblyImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

class ServicesAssemblyImpl: ServicesAssembly {
    
    private let apiKey = "7b61e9020f9b0b0746af3e03f1ee4dd7"
    
    private lazy var networkProvider = NetworkProviderImpl()
    
    private lazy var _citiesProvider = CitiesProviderImpl()
    private var _weatherService: WeatherServiceImpl?
    private lazy var _applicationInfoProvider = ApplicationInfoProviderImpl()
    
    // MARK: ServicesAssembly
    
    func citiesProvider() -> CitiesProvider {
        return _citiesProvider
    }
    
    func weatherService() -> WeatherService {
        if let _weatherService = _weatherService {
            return _weatherService
        }
        
        let newWeatherService =
            WeatherServiceImpl(networkProvider: networkProvider,
                               apiKey: apiKey)
        _weatherService = newWeatherService
        
        return newWeatherService
    }
    
    func applicationInfoProvider() -> ApplicationInfoProvider {
        return _applicationInfoProvider
    }
}
