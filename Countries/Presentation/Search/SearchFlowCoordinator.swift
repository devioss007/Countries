//
//  SearchFlowCoordinator.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit

protocol SearchFlowCoordinatorDependencies  {
    func makeSearchViewController(actions: SearchViewModelActions) -> SearchViewController
    func makeDetailSceneDIContainer(with country: Country) -> DetailSceneDIContainer
}

final class SearchFlowCoordinator {
    
    //MARK: Dependencies
    
    private weak var navigationController: UINavigationController?
    private let dependencies: SearchFlowCoordinatorDependencies
    
    // MARK: Init
    
    init(navigationController: UINavigationController,
         dependencies: SearchFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = SearchViewModelActions(routeToDetail: routeToDetail)
        let vc = dependencies.makeSearchViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func routeToDetail(_ item: Country) {
        guard let navigationController = navigationController else { fatalError() }
        let detailDI = dependencies.makeDetailSceneDIContainer(with: item)
        let flow = detailDI.makeDetailFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}

