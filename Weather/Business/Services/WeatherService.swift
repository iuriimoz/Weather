//
//  WeatherService.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/21/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation


enum WeatherServiceResult {
    case success(weather: WeatherData)
    case failure(error: Error)
}


enum WeatherServiceError: Error {
    case incorrectData
    case internalError
}


typealias WeatherServiceCompletion = (_ result: WeatherServiceResult) -> Void


protocol WeatherService {
    func getCurrentWeather(cityID: Int, completion: @escaping WeatherServiceCompletion)
    
    func defaultIconURL(iconID: String) -> URL
}


