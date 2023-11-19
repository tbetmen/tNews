//
//  MockAPIServiceConfig.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

@testable import tNews

final class MockAPIServiceConfig: APIServiceConfigInterface {
    var baseURL: String = "https://api.test.com"
    var headers: [String : String] = [:]
    var queryParams: [String : String] = [:]
}
