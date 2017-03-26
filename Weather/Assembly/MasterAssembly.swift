//
//  MasterAssembly.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

class MasterAssembly {
    private let _servicesAssembly = ServicesAssemblyImpl()
    private let _mainStoryAssembly = MainStoryAssemblyImpl()
    private let _settingsStoryAssembly = SettingsStoryAssemblyImpl()
    
    init() {
        let storyAssemblies: [AbstractStoryAssembly] =
            [_mainStoryAssembly, _settingsStoryAssembly]
        storyAssemblies.forEach { storyAssembly in
            storyAssembly.servicesAssembly = _servicesAssembly
        }
        
        _mainStoryAssembly.settingsStoryAssembly = _settingsStoryAssembly
    }
    
    var mainStoryAssembly: MainStoryAssembly {
        return _mainStoryAssembly
    }
}
