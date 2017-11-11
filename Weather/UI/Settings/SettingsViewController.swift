//
//  SettingsViewController.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    // MARK: DI-Properties
    
    var router: SettingsRouter!
    var applicationInfoProvider: ApplicationInfoProvider!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"

        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .done,
                            target: self,
                            action: #selector(doneButtonPressed))
        
        let appName = applicationInfoProvider.applicationName
        let version = applicationInfoProvider.applicationVersionNumber
        appNameVersionLabel.text = "\(appName) v\(version)"
        
        emailLabel.text = applicationInfoProvider.supportEmailAddress
    }
    
    // MARK: Outlets
    
    @IBOutlet private weak var appNameVersionLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    // MARK: Actions
    
    @objc func doneButtonPressed() {
        router.finish()
    }
}
