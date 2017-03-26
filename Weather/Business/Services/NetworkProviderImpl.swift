//
//  NetworkProviderImpl.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import Foundation
import Alamofire


class NetworkProviderImpl: NetworkProvider {
    func requestJSON(method: HTTPMethod,
                     url: URL,
                     parameters: [String : Any]?,
                     encoding: ParameterEncoding,
                     responseHandler: @escaping NetworkProviderHandler) {
        
        Alamofire.request(url,
                          method: method.toAlamofire(),
                          parameters: parameters,
                          encoding: encoding.toAlamofire(),
                          headers: nil).validate().responseJSON { response in
                            
                            switch response.result {
                            case .success(let json):
                                responseHandler(NetworkProviderResult.success(data: json))
                            case .failure(let error):
                                responseHandler(NetworkProviderResult.failure(error: error))
                            }
        }
    }
}


private extension HTTPMethod {
    func toAlamofire() -> Alamofire.HTTPMethod {
        switch self {
        case .options:
            return Alamofire.HTTPMethod.options
        case .get:
            return Alamofire.HTTPMethod.get
        case .head:
            return Alamofire.HTTPMethod.head
        case .post:
            return Alamofire.HTTPMethod.post
        case .put:
            return Alamofire.HTTPMethod.put
        case .patch:
            return Alamofire.HTTPMethod.patch
        case .delete:
            return Alamofire.HTTPMethod.delete
        case .trace:
            return Alamofire.HTTPMethod.trace
        case .connect:
            return Alamofire.HTTPMethod.connect
        }
    }
}


private extension ParameterEncoding {
    func toAlamofire() -> Alamofire.ParameterEncoding {
        switch self {
        case .json:
            return Alamofire.JSONEncoding.default
        case .url:
            return Alamofire.URLEncoding.default
        }
    }
}
