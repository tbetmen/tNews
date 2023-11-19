//
//  ArticleTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
@testable import tNews

final class ArticleTests: XCTestCase {
    
    private var sut: Article!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    func test_computedProperty() {
        // WHEN
        sut = Article(
            id: "1",
            imageURL: "imageURL",
            title: "title",
            date: "2022-09-14T04:29:04.957Z",
            contributor: "contributor",
            content: "content",
            slideshow: ["image1"]
        )
        
        // THEN
        XCTAssertEqual(sut.dateFormatted, "Rabu, 14 September 2022")
        XCTAssertEqual(sut.dateTimeLapse, "14 Sep 2022")
    }
    
    func test_emptySlideshow() {
        // WHEN
        sut = Article(
            id: "1",
            imageURL: "imageURL",
            title: "title",
            date: "2022-09-14T04:29:04.957Z",
            contributor: "contributor",
            content: "content"
        )
        
        // THEN
        XCTAssertTrue(sut.slideshow.isEmpty)
    }
    
    func test_dummyArticle() {
        // WHEN
        sut = Article.dummy()
        
        // THEN
        XCTAssertFalse(sut.id.isEmpty)
        XCTAssertFalse(sut.imageURL.isEmpty)
        XCTAssertFalse(sut.title.isEmpty)
        XCTAssertFalse(sut.date.isEmpty)
        XCTAssertFalse(sut.contributor.isEmpty)
        XCTAssertFalse(sut.content.isEmpty)
    }
}
