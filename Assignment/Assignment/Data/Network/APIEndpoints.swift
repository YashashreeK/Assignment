//
//  Webservice.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//
import Foundation

struct APIEndpoints {
    static func cryptoDetails(cryptoRequestDTO: CryptoRequestDTO) -> Endpoint<CryptoRequestDTO>{
        return Endpoint(path: "/assets",  method: .get, queryParametersEncodable: cryptoRequestDTO)
    }
}
