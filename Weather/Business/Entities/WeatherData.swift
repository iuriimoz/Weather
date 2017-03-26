//
//  WeatherData.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/21/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import SwiftyJSON


struct WeatherData {
    let temperature: Double // °C
    let pressure: Double    // hPa
    let humidity: Double    // %, 0 to 100
    let description: String
    let iconID: String
}


extension WeatherData: Equatable {}

func ==(lhs: WeatherData, rhs: WeatherData) -> Bool {
    return lhs.temperature == rhs.temperature &&
        lhs.pressure    == rhs.pressure &&
        lhs.humidity    == rhs.humidity &&
        lhs.description == rhs.description &&
        lhs.iconID      == rhs.iconID
    
}


extension WeatherData {
    struct JSONKeys {
        static let cityID = "id"
        static let cityName = "name"
        static let temperature = "temp"
        static let pressure = "pressure"
        static let humidity = "humidity"
        static let description = "description"
        static let iconID = "icon"
        
        static let main = "main"
        static let weather = "weather"
    }
    
    static func parse(json: Any) -> WeatherData? {
        let swiftyJSON = JSON(json)
        
        guard
            let temperature = swiftyJSON[JSONKeys.main][JSONKeys.temperature].double,
            let pressure    = swiftyJSON[JSONKeys.main][JSONKeys.pressure].double,
            let humidity    = swiftyJSON[JSONKeys.main][JSONKeys.humidity].double,
            let weather     = swiftyJSON[JSONKeys.weather].array?.first,
            let description = weather[JSONKeys.description].string,
            let iconID      = weather[JSONKeys.iconID].string else {
                return nil
        }
        
        return WeatherData(temperature: temperature,
                                  pressure: pressure,
                                  humidity: humidity,
                                  description: description,
                                  iconID: iconID)
    }
}
