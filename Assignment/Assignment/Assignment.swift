//
//  Assignment.swift
//  Assignment
//
//  Created by Yashashree on 03/05/22.
//

import Foundation
import UIKit

public class Assignment {
    @objc public static func launchCrypto(with window: UIWindow) {
        
        let appDIContainer = AppDIContainer()
        var appFlowCoordinator: AppFlowCoordinator?
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
        appFlowCoordinator = AppFlowCoordinator(navigationController: navigationController,appDIContainer: appDIContainer)
        appFlowCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
