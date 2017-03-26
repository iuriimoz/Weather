//
//  WeatherDataTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/26/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class WeatherDataTests: XCTestCase {
    
    func testEqual_true() {
        let weatherA = WeatherData(temperature: 1.0,
                                   pressure: 2.0,
                                   humidity: 3.0,
                                   description: "A",
                                   iconID: "iconIDA")
        let weatherB = weatherA
        
        XCTAssertEqual(weatherA, weatherB)
    }
    
    func testEqual_false() {
        let weatherA = WeatherData(temperature: 1.0,
                                   pressure: 2.0,
                                   humidity: 3.0,
                                   description: "A",
                                   iconID: "iconIDA")
        
        let weatherB = WeatherData(temperature: 3.0,
                                   pressure: 4.0,
                                   humidity: 5.0,
                                   description: "B",
                                   iconID: "iconIDB")
        
        XCTAssertNotEqual(weatherA, weatherB)
    }
    
    func testParse_success() {
        // GIVEN
        let expectedWeather = WeatherData.default
        let json: [String : Any] = WeatherData.defaultJSON
        
        // WHEN
        let weatherResult = WeatherData.parse(json: json)
        
        // THEN
        guard let weather = weatherResult else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(expectedWeather, weather)
    }
    
    func testParse_failure() {
        // GIVEN
        let json: [String : Any] = ["1" : 2]
        
        // WHEN
        let weatherResult = WeatherData.parse(json: json)
        
        // THEN
        XCTAssertNil(weatherResult)
    }
}
