//
//  SettingsStoryAssemblyMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/16/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class SettingsStoryAssemblyMock: SettingsStoryAssembly {
    
    // MARK: SettingsStoryAssembly
    
    weak var servicesAssembly: ServicesAssembly!
    
    func initialScren() -> UIViewController {
        XCTFail()
        return UIViewController()
    }
}
