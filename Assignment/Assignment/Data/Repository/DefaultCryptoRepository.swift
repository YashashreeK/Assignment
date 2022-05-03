//
//  DefaultCryptoRepository.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import Foundation

final class DefaultCryptoRepository {
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultCryptoRepository: CryptoRepository{
    func performCryptoDetails(requestDto: CryptoRequestDTO,completion:@escaping (Result<CryptoResponseDTO, NetworkError>) -> Void) {
        let endpoint = APIEndpoints.cryptoDetails(cryptoRequestDTO: requestDto)
        dataTransferService.request(with: endpoint) { (result: Result<CryptoResponseDTO, NetworkError>) in
            switch result{
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
