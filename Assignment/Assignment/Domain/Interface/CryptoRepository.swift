//
//  CryptoRepository.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import Foundation

protocol CryptoRepository {
    func performCryptoDetails(requestDto: CryptoRequestDTO,completion:@escaping (Result<CryptoResponseDTO, NetworkError>) -> Void)
}
