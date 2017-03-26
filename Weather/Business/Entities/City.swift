//
//  City.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

struct City {
    let id: Int
    let name: String
}


extension City: Equatable {}

func ==(lhs: City, rhs: City) -> Bool {
    return lhs.id == rhs.id && lhs.name == rhs.name
}
