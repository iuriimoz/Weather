//
//  NetworkProvider.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation


enum HTTPMethod {
    case options
    case get
    case head
    case post
    case put
    case patch
    case delete
    case trace
    case connect
}


enum ParameterEncoding {
    case json
    case url
}


enum NetworkProviderResult {
    case success(data: Any)
    case failure(error: Error)
}


typealias NetworkProviderHandler = (_ result: NetworkProviderResult) -> Void


protocol NetworkProvider {
    func requestJSON(method: HTTPMethod,
                     url: URL,
                     parameters: [String : Any]?,
                     encoding: ParameterEncoding,
                     responseHandler: @escaping NetworkProviderHandler)
}
