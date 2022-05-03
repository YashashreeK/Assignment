//
//  Parser.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import Foundation

protocol DataTransferService {
    typealias CompletionHandler<T> = (Result<T, NetworkError>) -> Void
    func request<T: Decodable, E: ResponseRequestable>(with endpoint: E, completion: @escaping CompletionHandler<T>)
}

public class DefaultDataTransferService: DataTransferService {
    private let networkService: NetworkService
    
     init(with networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func request<T, E>(with endpoint: E, completion: @escaping CompletionHandler<T>) where T : Decodable, E : ResponseRequestable {
        self.networkService.request(endpoint: endpoint) { (result: Result<T, NetworkError>) in
            switch result{
            case .success(let model):
                return completion(.success(model))
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }    
}
