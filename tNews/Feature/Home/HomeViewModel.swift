//
//  HomeViewModel.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

enum ContentState {
    case loading
    case loaded
}

final class HomeViewModel: ObservableObject {
    @Published public var trendingArticles = [Article]()
    @Published public var articles = [Article]()
    @Published public var contentState: ContentState = .loading
    
    private let articlesService: ArticlesServiceInterface
    
    init(articlesService: ArticlesServiceInterface = ArticlesService()) {
        self.articlesService = articlesService
    }
    
    public func loadData() {
        guard articles.isEmpty else { return }
        
        contentState = .loading
        
        articlesService.fetchArticles { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.trendingArticles.append(articles.randomElement()!)
                self?.trendingArticles.append(articles.randomElement()!)
                self?.trendingArticles.append(articles.randomElement()!)
            case .failure:()
            }
            self?.contentState = .loaded
        }
    }
}
