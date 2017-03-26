//
//  WeatherServiceImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class WeatherServiceImplTests: XCTestCase {
    
    func testGetForecast_success() {
        let apiKey = "12345"
        let cityID = 42
        
        let expectedURL = "http://api.openweathermap.org/data/2.5/weather?"
        let expectedParameters: [String : Any] = ["id"    : cityID,
                                                  "APPID" : apiKey,
                                                  "units" : "metric"]
        let expectedWeather = WeatherData.default
        let expectedWeatherJSON = WeatherData.defaultJSON
        
        let networkProviderMock = NetworkProviderMock()
        networkProviderMock.requestJSONClosure = {
            (method, url, parameters, encoding, responseHandler) in
            
            XCTAssertEqual(method, .get)
            XCTAssertEqual(url.absoluteString, expectedURL)
            guard let parameters = parameters else {
                XCTFail()
                return
            }
            XCTAssertTrue(isObjcEqual(parameters, expectedParameters))
            XCTAssertEqual(encoding, .url)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                responseHandler(.success(data: expectedWeatherJSON))
            })
        }
        
        let weatherService = WeatherServiceImpl(networkProvider: networkProviderMock,
                                                apiKey: apiKey)
        
        let expectation = self.expectation(description: #function)
        
        // WHEN
        weatherService.getCurrentWeather(cityID: cityID) { result in
            switch result {
            case .success(let weather):
                XCTAssertEqual(weather, expectedWeather)
            case .failure:
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
