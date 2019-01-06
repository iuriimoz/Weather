//
//  AppDelegate.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/21/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let masterAssembly = MasterAssembly()
    
    // MARK: UIApplicationDelegate
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = masterAssembly.mainStoryAssembly.initialScren()
        window?.makeKeyAndVisible()
        
        return true
    }
}
