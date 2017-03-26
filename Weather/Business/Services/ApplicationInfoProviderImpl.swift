//
//  ApplicationInfoProviderImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/26/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation


class ApplicationInfoProviderImpl: ApplicationInfoProvider {
    
    let bundle: Bundle
    
    convenience init() {
        self.init(bundle: Bundle.main)
    }
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    // MARK: ApplicationInfoProvider
    
    var applicationName: String {
        guard let name = infoDictionaryValue(key: "CFBundleDisplayName") else {
            assert(false)
            return ""
        }
        
        return name
    }
    var applicationVersionNumber: String {
        guard let versionNumber =
            infoDictionaryValue(key: "CFBundleShortVersionString") else {
                assert(false)
                return ""
        }
        
        return versionNumber
    }
    var supportEmailAddress: String {
        return "support@yourcompany.com"
    }
    
    private func infoDictionaryValue(key: String) -> String? {
        return bundle.object(forInfoDictionaryKey: key) as? String
    }
}
