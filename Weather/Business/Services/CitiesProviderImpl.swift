//
//  CitiesProviderImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation


class CitiesProviderImpl: CitiesProvider {
    
    // MARK: CitiesProvider
    
    private(set) var cities: [City] =
        [City(id: 703448,  name: "Kiev"),
         City(id: 2643743, name: "London"),
         City(id: 2172517, name: "Canberra"),
         City(id: 4450315, name: "Washington"),
         City(id: 1816670, name: "Beijing")]
}
