//
//  MockDataTransferService.swift
//  tNewsTests
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation
@testable import tNews

final class MockDataTransferService: DataTransferServiceInterface {
    var isSuccess: Bool = false
    var articles: [ArticleResponseDTO]
    var data: Data
    
    init(articles: [ArticleResponseDTO]) {
        self.articles = articles
        self.data = try! JSONEncoder().encode(articles)
    }
    
    func request<T, E>(
        with endpoint: E,
        completion: @escaping CompletionHandler<T>
    ) -> APIServiceCancellableInterface? where T : Decodable, T == E.Response, E : ResponseRequestable {
        if isSuccess {
            let result: T = try! JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        } else {
            completion(.failure(DataTransferError.noResponse))
        }
        return nil
    }
    
    func request<E>(
        with endpoint: E,
        completion: @escaping CompletionHandler<Void>
    ) -> APIServiceCancellableInterface? where E : ResponseRequestable, E.Response == () {
        return nil
    }
}
