//
//  CryptoResponseDTO.swift
//  Assignment
//
//  Created by Yashashree on 29/04/22.
//

import Foundation

struct CryptoResponseDTO: Codable{
    var data: [CryptoDetailModel]?
}

struct CryptoDetailModel: Codable {
    var id: String?
    var rank: String?
    var name: String?
    var percentage24Hrs: String?
    var price:String?

    enum DetailKey: String, CodingKey {
        case id
        case rank
        case name
        case percentage24Hrs = "changePercent24Hr"
        case price = "priceUsd"
    }

    init(from decoder: Decoder) throws {
        let detail = try decoder.container(keyedBy: DetailKey.self)
        id = try detail.decode(String.self, forKey: .id)
        rank = try detail.decode(String.self, forKey: .rank)
        name = try detail.decode(String.self, forKey: .name)
        percentage24Hrs = try detail.decode(String.self, forKey: .percentage24Hrs)
        price = try detail.decode(String.self, forKey: .price)
    }
}





