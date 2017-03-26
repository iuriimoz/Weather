//
//  SettingsStoryAssemblyImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/18/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class SettingsStoryAssemblyTests: XCTestCase {
    private struct AssemblyWithMocks {
        let settingsStoryAssembly: SettingsStoryAssemblyImpl
        let servicesAssemblyMock: ServicesAssemblyMock
    }
    
    private var assemblyWithMocks: AssemblyWithMocks!
    private var settingsStoryAssembly: SettingsStoryAssemblyImpl {
        return assemblyWithMocks.settingsStoryAssembly
    }
    
    override func setUp() {
        super.setUp()
        
        let servicesAssemblyMock = ServicesAssemblyMock()
        let settingsStoryAssembly = SettingsStoryAssemblyImpl()
        settingsStoryAssembly.servicesAssembly = servicesAssemblyMock
        
        assemblyWithMocks = AssemblyWithMocks(settingsStoryAssembly: settingsStoryAssembly,
                                              servicesAssemblyMock: servicesAssemblyMock)
    }
    
    override func tearDown() {
        assemblyWithMocks = nil
        
        super.tearDown()
    }
    
    func testInitialScreen() {
        // GIVEN
        configureForSettingsVC(assemblyWithMocks: assemblyWithMocks)
        
        // WHEN
        let result = settingsStoryAssembly.initialScren()
        
        // THEN
        guard let navController = result as? UINavigationController,
            let topViewController = navController.topViewController else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(topViewController is SettingsViewController)
    }
    
    func testSettingsViewController() {
        // GIVEN
        configureForSettingsVC(assemblyWithMocks: assemblyWithMocks)
        
        // WHEN
        let settingsVC = settingsStoryAssembly.settingsViewController()
        
        // THEN
        XCTAssertNotNil(settingsVC.router)
        XCTAssertNotNil(settingsVC.applicationInfoProvider)
    }
    
    // MARK: Utility
    
    private func configureForSettingsVC(assemblyWithMocks: AssemblyWithMocks) {
        assemblyWithMocks.servicesAssemblyMock.applicationInfoProviderClosure = {
            return ApplicationInfoProviderMock()
        }
    }
}
