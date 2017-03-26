//
//  WeatherServiceImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/21/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation
import Alamofire


class WeatherServiceImpl: WeatherService {
    private let networkProvider: NetworkProvider
    private let apiKey: String
    
    private let weatherURL = "http://api.openweathermap.org/data/2.5/weather?"
    
    private struct JSONKeys {
        static let appID = "APPID"
        static let cityID = "id"
        
        static let units = "units"
    }
    private let unitsValueMetric = "metric"
    
    init(networkProvider: NetworkProvider,
         apiKey: String) {
        self.networkProvider = networkProvider
        self.apiKey = apiKey
    }
    
    // MARK: WeatherService
    
    func getCurrentWeather(cityID: Int, completion: @escaping WeatherServiceCompletion) {
        let parameters: [String : Any] = [JSONKeys.cityID : cityID,
                                          JSONKeys.appID  : apiKey,
                                          JSONKeys.units  : unitsValueMetric]
        
        guard let url = URL(string: weatherURL) else {
            assert(false)
            completion(.failure(error: WeatherServiceError.internalError))
            return
        }
        
        let handler: NetworkProviderHandler = { result in
            switch result {
            case .success(let json):
                if let weather = WeatherData.parse(json: json) {
                    completion(.success(weather: weather))
                } else {
                    completion(.failure(error: WeatherServiceError.incorrectData))
                }
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
        
        networkProvider.requestJSON(method: .get,
                                    url: url,
                                    parameters: parameters,
                                    encoding: .url,
                                    responseHandler: handler)
    }
    
    func defaultIconURL(iconID: String) -> URL {
        return URL(string: "http://openweathermap.org/img/w/\(iconID).png")!
    }
}
