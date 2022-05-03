//
//  NetworkService.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import Foundation

protocol NetworkService {
    typealias CompletionHandler<T>  = (Result<T, NetworkError>) -> Void
    
    func request<T: Decodable>(endpoint: Requestable, completion: @escaping CompletionHandler<T>)
}

class DefaultNetworkService: NetworkService{
    
    private var config: NetworkConfigurable
    
    init(config: NetworkConfigurable) {
        self.config = config
    }
        
    func request<T>(endpoint: Requestable, completion: @escaping CompletionHandler<T>) where T : Decodable {
        do {
            let urlRequest = try endpoint.urlRequest(with: config)
            return request(request: urlRequest, completion: completion)
        } catch (let error){
            let strError = String(describing: error)
            completion(.failure(.error(message:strError)))
        }
    }
    
    func request<T: Decodable>(request: URLRequest, completion: @escaping CompletionHandler<T>){
//        guard let url = URL(string: url) else{
//            completion(.failure(.badURL))
//            return
//        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error(message: error.localizedDescription)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               (200...299).contains(httpResponse.statusCode) == false{
                completion(.failure(.badStatusCode(code: httpResponse.statusCode)))
                return
            }
            
            guard let detail = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let arr = try JSONDecoder().decode(T.self, from: detail)
                completion(.success(arr))
            } catch(_) {
                completion(.failure(.jsonConversionFailed))
            }
            
        }.resume()
    }
}
