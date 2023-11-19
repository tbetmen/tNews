//
//  MockAPISessionManager.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation
@testable import tNews

struct MockAPISessionManager: APISessionManagerInterface {
    let response: HTTPURLResponse?
    let data: Data?
    let error: Error?
    
    func request(
        _ request: URLRequest,
        completion: @escaping CompletionHandler
    ) -> APIServiceCancellableInterface {
        completion(data, response, error)
        return URLSession.shared.dataTask(with: URL(string: "https://api.test.com")!)
    }
}
