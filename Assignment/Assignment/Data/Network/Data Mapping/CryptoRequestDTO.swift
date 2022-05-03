//
//  CryptoRequestDTO.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//


import Foundation

struct CryptoRequestDTO: Codable {
    let limit: String
    let offset: String
    
    private enum CodingKeys: String, CodingKey{
        case limit = "limit"
        case offset = "offset"
    }
}
