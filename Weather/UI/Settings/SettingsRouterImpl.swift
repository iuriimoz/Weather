//
//  SettingsRouterImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class SettingsRouterImpl: SettingsRouter {
    
    // MARK: DI-properties
    
    weak var viewController: UIViewController!
    
    // MARK: SettingsRouter
    
    func finish() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
