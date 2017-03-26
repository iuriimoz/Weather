//
//  MainStoryAssemblyImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/16/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class MainStoryAssemblyImplTests: XCTestCase {
    
    private struct AssemblyWithMocks {
        let mainStoryAssembly: MainStoryAssemblyImpl
        let servicesAssemblyMock: ServicesAssemblyMock
        let settingsStoryAssemblyMock: SettingsStoryAssemblyMock
    }
    
    private var assemblyWithMocks: AssemblyWithMocks!
    private var mainStoryAssembly: MainStoryAssemblyImpl {
        return assemblyWithMocks.mainStoryAssembly
    }
    
    override func setUp() {
        super.setUp()
        
        let servicesAssemblyMock = ServicesAssemblyMock()
        let settingsStoryAssemblyMock = SettingsStoryAssemblyMock()
        
        let mainStoryAssembly = MainStoryAssemblyImpl()
        mainStoryAssembly.servicesAssembly = servicesAssemblyMock
        mainStoryAssembly.settingsStoryAssembly = settingsStoryAssemblyMock
        
        assemblyWithMocks =  AssemblyWithMocks(mainStoryAssembly: mainStoryAssembly,
                                               servicesAssemblyMock: servicesAssemblyMock,
                                               settingsStoryAssemblyMock: settingsStoryAssemblyMock)
    }
    
    override func tearDown() {
        assemblyWithMocks = nil
        
        super.tearDown()
    }
    
    func testInitialScren() {
        // GIVEN
        configureForCitiesVC(assemblyWithMocks: assemblyWithMocks)
        
        // WHEN
        let result = mainStoryAssembly.initialScren()
        
        // THEN
        guard let navController = result as? UINavigationController,
            let topViewController = navController.topViewController else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(topViewController is CitiesViewController)
    }
    
    func testCitiesViewController() {
        // GIVEN
        configureForCitiesVC(assemblyWithMocks: assemblyWithMocks)
        
        // WHEN
        let citiesVC = mainStoryAssembly.citiesViewController()
        
        // THEN
        XCTAssertNotNil(citiesVC.router)
        XCTAssertNotNil(citiesVC.citiesProvider)
    }
    
    func testCurrentWeatherViewController() {
        // GIVEN
        assemblyWithMocks.servicesAssemblyMock.weatherServiceClosure = {
            return WeatherServiceMock()
        }
        
        let city = City(id: 1, name: "TestName")
        
        // WHEN
        let currentWeatherVC = mainStoryAssembly.currentWeatherViewController(city: city)
        
        // THEN
        XCTAssertNotNil(currentWeatherVC.city)
        XCTAssertNotNil(currentWeatherVC.weatherService)
    }
    
    // MARK: Utility
    
    private func configureForCitiesVC(assemblyWithMocks: AssemblyWithMocks) {
        assemblyWithMocks.servicesAssemblyMock.citiesProviderClosure = {
            let citiesProviderMock = CitiesProviderMock()
            citiesProviderMock.citiesClosure = { return [City]() }
            return citiesProviderMock
        }
    }
}
