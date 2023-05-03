//
//  HomeSceneDIContainer.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class HomeSceneDIContainer: HomeFlowCoordinatorDependencies {
    func makeSearchSceneDIContainer() -> SearchSceneDIContainer {
        return SearchSceneDIContainer()
    }
    
    func makeDetailSceneDIContainer(with country: Country) -> DetailSceneDIContainer {
        return DetailSceneDIContainer(country: country)
    }
    
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController {
        let viewModel = HomeViewModel(actions: actions, networkingService: NetworkingService())
        return HomeViewController(viewModel: viewModel)
    }

    // MARK: - Flow Coordinators

    func makeHomeFlowCoordinator(navigationController: UINavigationController) -> HomeFlowCoordinator {
        return HomeFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
