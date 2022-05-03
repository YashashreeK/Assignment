//
//  CryptoDIContainer.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import UIKit

final class CryptoDIContainer {
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeCryptoFlowCoordinator(navigation: UINavigationController) -> CryptoFlowCoordinator{
        return CryptoFlowCoordinator(navigationController: navigation, dependencies: self)
    }
}

extension CryptoDIContainer: CryptoFlowCoordinatorDependencies {
    
    func makeCryptoViewController() -> CryptoViewController {
        return CryptoViewController.create(with: makeCryptoViewModel())
    }
    
    private func makeCryptoViewModel() -> CryptoViewModel{
        return DefaultCryptoViewModel(cryptoUseCase: makeCryptoUseCase())
    }
    
    private func makeCryptoUseCase() -> CryptoUseCase {
        return DefaultCryptoUseCase(repository: makeCryptoRepository())
    }
    
    private func makeCryptoRepository() -> CryptoRepository {
        return DefaultCryptoRepository(dataTransferService: dependencies.apiDataTransferService)
    }
}
