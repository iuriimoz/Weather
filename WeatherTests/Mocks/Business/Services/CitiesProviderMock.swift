//
//  CitiesProviderMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/15/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class CitiesProviderMock: CitiesProvider {
    
    var citiesWasCalled = false
    typealias CitiesClosure = () -> [City]
    var citiesClosure: CitiesClosure?
    
    // MARK: CitiesProvider
    
    var cities: [City] {
        citiesWasCalled = true
        
        guard let citiesClosure = citiesClosure else {
            XCTFail()
            return [City]()
        }
        
        return citiesClosure()
    }
}

