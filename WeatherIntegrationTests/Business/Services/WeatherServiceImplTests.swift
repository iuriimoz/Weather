//
//  WeatherServiceImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/18/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class WeatherServiceImplTests: XCTestCase {
    
    private let apiKey = "7b61e9020f9b0b0746af3e03f1ee4dd7"
    private var weatherService: WeatherServiceImpl!
    
    override func setUp() {
        super.setUp()
        
        let networkProvider = NetworkProviderImpl()
        weatherService = WeatherServiceImpl(networkProvider: networkProvider,
                                            apiKey: apiKey)
    }
    
    override func tearDown() {
        weatherService = nil
        
        super.tearDown()
    }
    
    func testGetForecast() {
        let city = City(id: 703448,  name: "Kiev")
        
        let expectation = self.expectation(description: #function)
        
        weatherService.getCurrentWeather(cityID: city.id) { result in
            switch result {
            case .success:
                break
            case .failure:
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
