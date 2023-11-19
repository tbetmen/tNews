//
//  MockArticlesService.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

@testable import tNews

final class MockArticlesService: ArticlesServiceInterface {
    var isFetchSuccess: Bool = false
    
    func fetchArticles(
        completion: @escaping (Result<[tNews.Article], Error>) -> Void
    ) -> tNews.APIServiceCancellableInterface? {
        if isFetchSuccess {
            completion(.success([Article.dummy()]))
        } else {
            completion(.failure(DataTransferError.noResponse))
        }
        return nil
    }
}
