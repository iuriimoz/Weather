//
//  CitiesProviderImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/27/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class CitiesProviderImplTests: XCTestCase {
    
    func testCities() {
        // GIVEN
        let citiesProvider = CitiesProviderImpl()
        
        // WHEN
        let cities = citiesProvider.cities
        
        // THEN
        XCTAssertEqual(cities.count, 5)
    }
}
