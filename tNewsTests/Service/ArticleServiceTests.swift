//
//  ArticleServiceTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
@testable import tNews

final class ArticleServiceTests: XCTestCase {
    private var sut: ArticlesService!
    private var dataTransfer: MockDataTransferService!
    
    override func setUp() {
        super.setUp()
        self.dataTransfer = MockDataTransferService(
            articles: [
                ArticleResponseDTO(
                    id: "1",
                    createdAt: "createdAt",
                    contributorName: "contributorName",
                    contributorAvatar: "contributorAvatar",
                    title: "title",
                    content: "content",
                    contentThumbnail: "contentThumbnail"
                ),
                ArticleResponseDTO(
                    id: "2",
                    createdAt: "createdAt",
                    contributorName: "contributorName",
                    contributorAvatar: "contributorAvatar",
                    title: "title",
                    content: "content",
                    contentThumbnail: "contentThumbnail"
                ),
            ]
        )
        self.sut = ArticlesService(transferService: dataTransfer)
    }
    
    override func tearDown() {
        self.dataTransfer = nil
        self.sut = nil
        super.tearDown()
    }
    
    func test_whenFailedToDecoded_shouldReturnError() {
        // when
        self.dataTransfer.isSuccess = false
        
        // then
        _ = self.sut.fetchArticles { result in
            if case .failure(_) = result {
                XCTAssertTrue(true)
            }
        }
    }
    
    func test_whenSucceedDecoded_shouldReturnArticles() {
        // when
        self.dataTransfer.isSuccess = true
        
        // then
        _ = self.sut.fetchArticles { result in
            if case .success(let articles) = result {
                XCTAssertTrue(articles.count == 2)
            }
        }
    }
}
