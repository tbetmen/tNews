//
//  HomeViewModelTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
@testable import tNews

final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    private var service: MockArticlesService!
    
    override func setUp() {
        super.setUp()
        self.service = MockArticlesService()
        self.sut = HomeViewModel(
            articlesService: service
        )
    }
    
    override func tearDown() {
        self.sut = nil
        self.service = nil
        super.tearDown()
    }
    
    func test_whenServiceSucceed_shouldReturnArticles() {
        // given
        service.isFetchSuccess = true
        
        // when
        sut.loadData()
        
        // then
        XCTAssertFalse(self.sut.articles.isEmpty)
        XCTAssertFalse(self.sut.trendingArticles.isEmpty)
    }
    
    func test_whenServiceFailed_shouldHave0Articles() {
        // given
        service.isFetchSuccess = false
        
        // when
        sut.loadData()
        
        // then
        XCTAssertTrue(self.sut.articles.isEmpty)
        XCTAssertTrue(self.sut.trendingArticles.isEmpty)
    }
    
    func test_whenArticlesNotEmpty_shouldNotReturnArticlesFromAPI() {
        // given
        sut.articles = [Article.dummy()]
        sut.trendingArticles = [Article.dummy()]
        
        // when
        sut.loadData()
        
        // then
        XCTAssertFalse(self.sut.articles.isEmpty)
        XCTAssertFalse(self.sut.trendingArticles.isEmpty)
    }
}
