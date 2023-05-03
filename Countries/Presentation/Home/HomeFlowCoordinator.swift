//
//  HomeFlowCoordinator.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

protocol HomeFlowCoordinatorDependencies  {
    func makeHomeViewController(actions: HomeViewModelActions) -> HomeViewController
    func makeDetailSceneDIContainer(with country: Country) -> DetailSceneDIContainer
    func makeSearchSceneDIContainer() -> SearchSceneDIContainer
}

final class HomeFlowCoordinator {
    
    //MARK: Dependencies
    
    private weak var navigationController: UINavigationController?
    private let dependencies: HomeFlowCoordinatorDependencies
    
    // MARK: Init
    
    init(navigationController: UINavigationController,
         dependencies: HomeFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = HomeViewModelActions(routeToDetail: routeToDetail,
                                           routeToSearch: routeToSearch)
        let vc = dependencies.makeHomeViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func routeToDetail(_ item: Country) {
        guard let navigationController = navigationController else { fatalError() }
        let detailDI = dependencies.makeDetailSceneDIContainer(with: item)
        let flow = detailDI.makeDetailFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
    
    private func routeToSearch() {
        guard let navigationController = navigationController else { fatalError() }
        let detailDI = dependencies.makeSearchSceneDIContainer()
        let flow = detailDI.makeSearchFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
