//
//  SettingsStoryAssemblyImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class SettingsStoryAssemblyImpl: SettingsStoryAssembly {
    
    // MARK: SettingsStoryAssembly
    
    weak var servicesAssembly: ServicesAssembly!
    
    func initialScren() -> UIViewController {
        let settingsVC = settingsViewController()
        
        return UINavigationController(rootViewController: settingsVC)
    }
    
    // MARK: Utility
    
    func settingsViewController() -> SettingsViewController {
        let vc = SettingsViewController()
        let router = SettingsRouterImpl()
        
        vc.router = router
        vc.applicationInfoProvider = servicesAssembly.applicationInfoProvider()
        
        router.viewController = vc
        
        return vc
    }
}
