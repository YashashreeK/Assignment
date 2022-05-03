//
//  AppFlowCoordinator.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//


import UIKit

final class AppFlowCoordinator{
    
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let cryptoDIContainer = appDIContainer.makeCryptoDIConatiner()
        let flow = cryptoDIContainer.makeCryptoFlowCoordinator(navigation: self.navigationController)
        flow.start()
    }
}
