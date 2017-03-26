//
//  WeatherData.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

@testable import Weather


extension WeatherData {
    static var `default`: WeatherData {
        return WeatherData(temperature: 1.0,
                           pressure: 2.0,
                           humidity: 3.0,
                           description: "descr",
                           iconID: "icon-id")
    }
    
    static var defaultJSON: [String : Any] {
        let data = self.default
        
        return ["main"    : ["humidity" : data.humidity,
                             "pressure" : data.pressure,
                             "temp"     : data.temperature],
                "weather" : [["description" : data.description,
                              "icon"        : data.iconID]]]
    }
}
