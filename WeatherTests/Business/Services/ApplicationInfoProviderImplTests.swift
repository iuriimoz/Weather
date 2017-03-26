//
//  ApplicationInfoProviderImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/27/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class ApplicationInfoProviderImplTests: XCTestCase {
    
    func testSupportEmailAddress() {
        let bundle = Bundle(for: type(of: self))
        let provider = ApplicationInfoProviderImpl(bundle: bundle)
        
        XCTAssertTrue(provider.bundle === bundle)
        XCTAssertEqual(provider.applicationName, "WeatherTests")
        XCTAssertEqual(provider.applicationVersionNumber, "1.0")
        XCTAssertEqual(provider.supportEmailAddress, "support@yourcompany.com")
    }
}
