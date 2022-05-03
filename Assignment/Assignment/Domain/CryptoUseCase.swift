//
//  CryptoUseCase.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//


import Foundation

protocol CryptoUseCase {
    func excuteCryptoDetails(limit: String, offset: String, completion: @escaping (Result<CryptoResponseDTO, NetworkError>) -> Void)
}

final class DefaultCryptoUseCase: CryptoUseCase{
    private let repository: CryptoRepository
    
    init(repository: CryptoRepository) {
        self.repository = repository
    }
    
    func excuteCryptoDetails(limit: String, offset: String, completion: @escaping (Result<CryptoResponseDTO, NetworkError>) -> Void) {
        repository.performCryptoDetails(requestDto: CryptoRequestDTO(limit: limit, offset: offset)) { result in
            completion(result)
        }
    }
}
