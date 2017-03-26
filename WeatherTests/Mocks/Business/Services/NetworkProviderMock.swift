//
//  NetworkProviderMock.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
@testable import Weather


class NetworkProviderMock: NetworkProvider {
    
    var requestJSONWasCalled = false
    typealias RequestJSONClosure = (
        _ method: HTTPMethod,
        _ url: URL,
        _ parameters: [String : Any]?,
        _ encoding: ParameterEncoding,
        _ responseHandler: @escaping NetworkProviderHandler) -> Void
    var requestJSONClosure: RequestJSONClosure?
    
    
    // MARK: NetworkProvider
    
    func requestJSON(method: HTTPMethod,
                     url: URL,
                     parameters: [String : Any]?,
                     encoding: ParameterEncoding,
                     responseHandler: @escaping NetworkProviderHandler) {
        
        requestJSONWasCalled = true
        
        guard let requestJSONClosure = requestJSONClosure else {
            XCTFail()
            return
        }
        
        requestJSONClosure(method, url, parameters, encoding, responseHandler)
    }
}
