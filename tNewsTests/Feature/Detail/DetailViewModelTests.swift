//
//  DetailViewModelTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
@testable import tNews

final class DetailViewModelTests: XCTestCase {
    func test_whenArticleDoesNotHaveSlideshow_shouldShowThumbnail() {
        // when
        let sut = DetailViewModel(
            article: Article(
                id: "1",
                imageURL: "url",
                title: "title",
                date: "date",
                contributor: "contributor",
                content: "content"
            )
        )
        
        // then
        XCTAssertEqual(sut.thumbnailURL, "url")
        XCTAssertTrue(sut.isSlideshowEmpty)
    }
    
    func test_whenArticleHaveSlideshow_shouldShowSlideshow() {
        // when
        let sut = DetailViewModel(
            article: Article(
                id: "1",
                imageURL: "url",
                title: "title",
                date: "date",
                contributor: "contributor",
                content: "content",
                slideshow: ["slideshowUrl"]
            )
        )
        
        // then
        XCTAssertEqual(sut.thumbnailURL, "slideshowUrl")
        XCTAssertFalse(sut.isSlideshowEmpty)
    }
    
    func test_whenUpdateThumbnailHappen_shouldUpdateThumbnail() {
        // given
        let sut = DetailViewModel(
            article: Article(
                id: "1",
                imageURL: "url",
                title: "title",
                date: "date",
                contributor: "contributor",
                content: "content",
                slideshow: ["slideshowUrl", "slideshowUrl0"]
            )
        )
        XCTAssertEqual(sut.thumbnailURL, "slideshowUrl")
        
        // when
        sut.updateThumbnail(at: 1)
        
        // then
        XCTAssertEqual(sut.thumbnailURL, "slideshowUrl0")
    }
}
