//
//  MainStoryAssemblyMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/16/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class MainStoryAssemblyMock: MainStoryAssembly {
    
    // MARK: MainStoryAssembly
    
    weak var servicesAssembly: ServicesAssembly!
    
    func initialScren() -> UIViewController {
        XCTFail()
        return UIViewController()
    }
    
    func citiesViewController() -> CitiesViewController {
        XCTFail()
        return nil as CitiesViewController!
    }
    
    func currentWeatherViewController(city: City) -> CurrentWeatherViewController {
        XCTFail()
        return nil as CurrentWeatherViewController!
    }
}
