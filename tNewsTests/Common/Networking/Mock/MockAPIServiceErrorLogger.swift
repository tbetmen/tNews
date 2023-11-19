//
//  MockAPIServiceErrorLogger.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation
@testable import tNews

final class MockAPIServiceErrorLogger: APIServiceErrorLoggerInterface {
    var loggedErrors: [Error] = []
    func log(request: URLRequest) {}
    func log(responseData data: Data?, response: URLResponse?) {}
    func log(error: Error) {
        self.loggedErrors.append(error)
    }
}
