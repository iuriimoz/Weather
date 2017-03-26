//
//  ApplicationInfoProvider.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/26/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

protocol ApplicationInfoProvider {
    var applicationName: String { get }
    var applicationVersionNumber: String { get }
    var supportEmailAddress: String { get }
}

