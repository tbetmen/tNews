//
//  ArticleResponseDTO.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

struct ArticleResponseDTO: Codable {
    let id: String
    let createdAt, contributorName: String
    let contributorAvatar: String
    let title, content: String
    let contentThumbnail: String
    var slideshow = [String]()
}

extension Array where Element == ArticleResponseDTO {
    func toEntity() -> [Article] {
        self.map {
            Article(
                id: $0.id,
                imageURL: $0.contentThumbnail,
                title: $0.title,
                date: $0.createdAt,
                contributor: $0.contributorName,
                content: $0.content,
                slideshow: $0.slideshow
            )
        }
    }
}
