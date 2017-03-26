//
//  ServicesAssemblyImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/13/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class ServicesAssemblyImplTests: XCTestCase {
    
    func testAssembling() {
        let assembly = ServicesAssemblyImpl()
        
        XCTAssertTrue(assembly.citiesProvider() is CitiesProviderImpl)
        XCTAssertTrue(assembly.weatherService() is WeatherServiceImpl)
        XCTAssertTrue(assembly.applicationInfoProvider() is ApplicationInfoProviderImpl)   
    }
}
