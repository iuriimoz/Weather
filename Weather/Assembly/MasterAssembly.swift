//
//  MasterAssembly.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

class MasterAssembly {
    private var _servicesAssembly: ServicesAssemblyImpl!
    private var _mainStoryAssembly: MainStoryAssemblyImpl!
    private var _settingsStoryAssembly: SettingsStoryAssemblyImpl!
    
    init() {
        _servicesAssembly = ServicesAssemblyImpl()
        _mainStoryAssembly = MainStoryAssemblyImpl()
        _settingsStoryAssembly = SettingsStoryAssemblyImpl()
        
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
