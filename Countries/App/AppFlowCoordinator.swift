//
//  AppFlowCoordinator.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class AppFlowCoordinator {
    
    // MARK: Dependencies
    
    private let navigationController: UINavigationController
    private let diContainer: AppDIContainer

    // MARK: Init
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        routeToHome()
    }
    
    private func routeToHome() {
        let homeDI = diContainer.makeHomeSceneDIContainer()
        let flow = homeDI.makeHomeFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
