//
//  CryptoFlowCoordinator.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//

import UIKit

protocol CryptoFlowCoordinatorDependencies {
    func makeCryptoViewController() -> CryptoViewController
}

final class CryptoFlowCoordinator {
    private let navigationController: UINavigationController
    private let dependencies: CryptoFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: CryptoFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let vc = dependencies.makeCryptoViewController()
        self.navigationController.pushViewController(vc, animated: false)
    }
}
