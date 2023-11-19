//
//  ArticlesEndpoint.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

struct ArticlesEndpoint {
    static func getArticles() -> APIEndpoint<[ArticleResponseDTO]> {
        APIEndpoint(
            path: APIPath.articles.rawValue,
            method: .get
        )
    }
}
