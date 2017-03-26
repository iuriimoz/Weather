//
//  ServicesAssemblyMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/14/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class ServicesAssemblyMock: ServicesAssembly {
    
    var citiesProviderWasCalled: Bool = false
    typealias CitiesProviderClosure = () -> CitiesProvider
    var citiesProviderClosure: CitiesProviderClosure?
    
    var weatherServiceWasCalled: Bool = false
    typealias WeatherServiceClosure = () -> WeatherService
    var weatherServiceClosure: WeatherServiceClosure?
    
    var applicationInfoProviderWasCalled: Bool = false
    typealias ApplicationInfoProviderClosure = () -> ApplicationInfoProvider
    var applicationInfoProviderClosure: ApplicationInfoProviderClosure?
    
    // MARK:
    
    func citiesProvider() -> CitiesProvider {
        citiesProviderWasCalled = true
        
        guard let citiesProviderClosure = citiesProviderClosure else {
            XCTFail()
            return nil as CitiesProvider!
        }
        
        return citiesProviderClosure()
    }
    
    func weatherService() -> WeatherService {
        weatherServiceWasCalled = true
        
        guard let weatherServiceClosure = weatherServiceClosure else {
            XCTFail()
            return nil as WeatherService!
        }
        
        return weatherServiceClosure()
    }
    
    func applicationInfoProvider() -> ApplicationInfoProvider {
        applicationInfoProviderWasCalled = true
        
        guard let applicationInfoProviderClosure = applicationInfoProviderClosure else {
            XCTFail()
            return nil as ApplicationInfoProvider!
        }
        
        return applicationInfoProviderClosure()
    }
}
