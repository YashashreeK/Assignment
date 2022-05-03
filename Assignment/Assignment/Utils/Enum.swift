//
//  Util.swift
//  Assignment
//
//  Created by Yashashree on 28/04/22.
//

import UIKit

enum Font: String {
      case regular = "Helvetica"

      func of(size: CGFloat) -> UIFont? {
            return UIFont(name: rawValue, size: size)
      }
}

enum NetworkError: Error {
    case badURL
    case noData
    case badStatusCode(code: Int)
    case jsonConversionFailed
    case error(message: String)
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "The requested url is not proper"
        case .badStatusCode(let code):
            return "Error: unexpected status code \(code)"
        case .noData:
            return "Error: No data found"
        case .jsonConversionFailed:
            return "Error occurred while processing details"
        case .error(let message):
            return message
        }
    }
}
