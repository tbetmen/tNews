//
//  MockAPIEndpoint.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

@testable import tNews

struct MockAPIEndpoint: Requestable {
    var path: String
    var method: HTTPMethod
    var useBaseURL: Bool = true
    var headers: [String : String] = [:]
    var queryParametersEncodable: Encodable?
    var queryParameters: [String : Any] = [:]
    var bodyParametersEncodable: Encodable?
    var bodyParameters: [String : Any] = [:]
    var bodyEncoding: HTTPBodyEncoding = .json
    
    init(path: String, method: HTTPMethod) {
        self.path = path
        self.method = method
    }
}
