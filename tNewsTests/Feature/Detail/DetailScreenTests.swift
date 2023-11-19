//
//  DetailScreenTests.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import tNews

final class DetailScreenTests: XCTestCase {
    func test_whenStateLoading_shouldShowShimmer() {
        // when
        let sut = DetailScreen(
            article: Article(
                id: "1",
                imageURL: "imageURL",
                title: "title",
                date: "date",
                contributor: "contributor",
                content: "content",
                slideshow: ["satu", "dua"]
            )
        )
        
        // then
        try! sut.inspect()
            .find(viewWithAccessibilityIdentifier: "backButton")
            .button()
            .tap()
        let thumbnailView = try! sut.inspect()
            .find(ThumbnailView.self)
            .isAbsent
        let thumbnailOptionView = try! sut.inspect()
            .find(viewWithAccessibilityIdentifier: "thumbnailOption")
        try! thumbnailOptionView.button().tap()

        XCTAssertFalse(thumbnailView)
        XCTAssertFalse(thumbnailOptionView.isAbsent)
    }
}
