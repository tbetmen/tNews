//
//  HomeScreenTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import SwiftUI
import ViewInspector
import XCTest
@testable import tNews

final class HomeScreenTests: XCTestCase {
    private var sut: HomeScreen!
    private var viewModel: HomeViewModel!
    private var service: MockArticlesService!
    
    override func setUp() {
        super.setUp()
        self.service = MockArticlesService()
        self.viewModel = HomeViewModel(
            articlesService: service
        )
        self.sut = HomeScreen(viewModel: viewModel)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.service = nil
        self.sut = nil
        super.tearDown()
    }
    
    func test_whenStateLoading_shouldShowShimmer() {
        // when
        viewModel.contentState = .loading
        
        // then
        let shimmerIsAbsent = try! sut.inspect()
            .find(Shimmer.self)
            .isAbsent
        XCTAssertFalse(shimmerIsAbsent)
    }
    
    func test_whenStateLoaded_shouldShowContent() {
        // when
        viewModel.articles = [
            Article.dummy(),
            Article.dummy(),
        ]
        viewModel.trendingArticles = [
            Article.dummy(),
            Article.dummy(),
        ]
        viewModel.contentState = .loaded
        
        // then
        let carouselView = try! sut.inspect()
            .find(viewWithAccessibilityIdentifier: "tabView")
            .find(ThumbnailView.self)
            .isAbsent
        let indicatorView = try! sut.inspect()
            .find(viewWithAccessibilityIdentifier: "indicatorView")
            .isAbsent
        let thumbnailNewsCellView = try! sut.inspect()
            .find(viewWithAccessibilityIdentifier: "latestNews")
            .find(NewsCell.self)
            .find(ThumbnailView.self)
            .isAbsent
        XCTAssertFalse(carouselView)
        XCTAssertFalse(indicatorView)
        XCTAssertFalse(thumbnailNewsCellView)
    }
}
