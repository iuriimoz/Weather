//
//  CityTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/26/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class CityTests: XCTestCase {
    
    func testEqual_true() {
        let cityA = City(id: 1, name: "A")
        let cityB = cityA
        
        XCTAssertEqual(cityA, cityB)
    }
    
    func testEqual_false() {
        let cityA = City(id: 1, name: "A")
        let cityB = City(id: 2, name: "B")
        
        XCTAssertNotEqual(cityA, cityB)
    }
}
