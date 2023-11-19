//
//  ArticlesService.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

protocol ArticlesServiceInterface {
    @discardableResult
    func fetchArticles(
        completion: @escaping (Result<[Article], Error>) -> Void
    ) -> APIServiceCancellableInterface?
}

final class ArticlesService {
    private let transferService: DataTransferServiceInterface
    
    init(transferService: DataTransferServiceInterface = DataTransferService()) {
        self.transferService = transferService
    }
}

extension ArticlesService: ArticlesServiceInterface {
    func fetchArticles(
        completion: @escaping (Result<[Article], Error>) -> Void
    ) -> APIServiceCancellableInterface? {
        let endpoint = ArticlesEndpoint.getArticles()
        return transferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.toEntity()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
