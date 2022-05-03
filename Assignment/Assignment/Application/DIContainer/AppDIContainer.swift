//
//  AppDIContainer.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//


import Foundation

final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!)
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    func makeCryptoDIConatiner() -> CryptoDIContainer{
       return CryptoDIContainer(dependencies: CryptoDIContainer.Dependencies(apiDataTransferService: apiDataTransferService))
    }
}
