//
//  SearchSceneDIContainer.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit

final class SearchSceneDIContainer: SearchFlowCoordinatorDependencies {
    func makeSearchViewController(actions: SearchViewModelActions) -> SearchViewController {
        return SearchViewController(viewModel: SearchViewModel(actions: actions, networkingService: NetworkingService()))
    }
    
    func makeSearchFlowCoordinator(navigationController: UINavigationController) -> SearchFlowCoordinator {
        return SearchFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    func makeDetailSceneDIContainer(with country: Country) -> DetailSceneDIContainer {
        return DetailSceneDIContainer(country: country)
    }
    
}

