//
//  DetailSceneDIContainer.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class DetailSceneDIContainer: DetailFlowCoordinatorDependencies {
    
    // MARK: - Dependencies

    private let country: Country
    
    // MARK: - Init
    
    init(country: Country) {
        self.country = country
    }
    
    func makeDetailViewController(actions: DetailViewModelActions) -> DetailViewController {
        return DetailViewController(viewModel: DetailViewModel(actions: actions, country: country))
    }
    
    func makeDetailFlowCoordinator(navigationController: UINavigationController) -> DetailFlowCoordinator {
        return DetailFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}
