//
//  Any+Extensions.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation


func isObjcEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    guard
        let lhsNSObject = lhs as? NSObject,
        let rhsNSObject = rhs as? NSObject else {
            
            return false
    }
    
    return lhsNSObject.isEqual(rhsNSObject)
}
