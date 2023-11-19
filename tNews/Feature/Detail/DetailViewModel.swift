//
//  DetailViewModel.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published public var thumbnailURL = ""
    
    public let article: Article
    
    public var isSlideshowEmpty: Bool {
        article.slideshow.isEmpty
    }
    
    init(article: Article) {
        self.article = article
        thumbnailURL = isSlideshowEmpty ? article.imageURL : article.slideshow[0]
    }
    
    public func updateThumbnail(at index: Int) {
        thumbnailURL = article.slideshow[index]
    }
}
