//
//  APIPathTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
@testable import tNews

final class APIPathTests: XCTestCase {
    func test_articlesPath() {
        XCTAssertEqual(APIPath.articles.rawValue, "innocent/newsapp/articles")
    }
}
