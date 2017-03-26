//
//  AbstractStoryAssembly.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

protocol AbstractStoryAssembly: class {
    weak var servicesAssembly: ServicesAssembly! { get set }
}
