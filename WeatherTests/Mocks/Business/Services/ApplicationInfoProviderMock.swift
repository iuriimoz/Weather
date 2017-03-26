//
//  ApplicationInfoProviderMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/16/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class ApplicationInfoProviderMock: ApplicationInfoProvider {
    
    // MARK: ApplicationInfoProvider
    
    var applicationName: String {
        XCTFail()
        return ""
    }
    
    var applicationVersionNumber: String {
        XCTFail()
        return ""
    }
    
    var supportEmailAddress: String {
        XCTFail()
        return ""
    }
}
