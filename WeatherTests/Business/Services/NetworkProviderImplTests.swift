//
//  NetworkProviderImplTests.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 3/12/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Weather


class NetworkProviderImplTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        
        super.tearDown()
    }
    
    func testRequestJSON() {
        guard let url = URL(string: "http://example.com/lalala") else {
            XCTFail()
            return
        }
        
        let expectedJSON = ["1" : 2]
        
        stub(condition: { _ in
            return true
        }) { _ in
            return OHHTTPStubsResponse(jsonObject: [:],
                                       statusCode: 404,
                                       headers: nil)
        }
        
        stub(condition: { request in
            guard let requestURL = request.url else {
                return false
            }
            
            return requestURL == url
            
        }) { _ in
            return OHHTTPStubsResponse(jsonObject: expectedJSON,
                                       statusCode: 200,
                                       headers: nil)
        }
        
        let provider = NetworkProviderImpl()
        
        let expectation = self.expectation(description: #function)
        
        provider.requestJSON(method: .get,
                             url: url,
                             parameters: nil,
                             encoding: .url) { result in
                                
                                switch result {
                                case .success(let data):
                                    XCTAssertTrue(isObjcEqual(data, expectedJSON))
                                case .failure:
                                    XCTFail()
                                }
                                
                                expectation.fulfill()
        }
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
