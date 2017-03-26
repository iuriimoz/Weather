//
//  WeatherServiceMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/15/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class WeatherServiceMock: WeatherService {
    
    var getForecastWasCalled: Bool = false
    typealias GetForecastClosure =
        (_ cityID: Int, _ completion: @escaping WeatherServiceCompletion) -> Void
    var getForecastClosure: GetForecastClosure?
    
    var defaultIconURLWasCalled: Bool = false
    typealias DefaultIconURLClosure = (_ iconID: String) -> URL
    var defaultIconURLClosure: DefaultIconURLClosure?
    
    // MARK: WeatherService
    
    func getCurrentWeather(cityID: Int, completion: @escaping WeatherServiceCompletion) {
        getForecastWasCalled = true
        
        guard let getForecastClosure = getForecastClosure else {
            XCTFail()
            return
        }
        
        getForecastClosure(cityID, completion)
    }
    
    func defaultIconURL(iconID: String) -> URL {
        defaultIconURLWasCalled = true
        
        guard let defaultIconURLClosure = defaultIconURLClosure else {
            XCTFail()
            return URL(string: "")!
        }
        
        return defaultIconURLClosure(iconID)
    }
}
