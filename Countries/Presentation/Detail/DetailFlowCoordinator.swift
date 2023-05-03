//
//  DetailFlowCoordinator.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

protocol DetailFlowCoordinatorDependencies  {
    func makeDetailViewController(actions: DetailViewModelActions) -> DetailViewController
}

final class DetailFlowCoordinator {
    
    //MARK: Dependencies
    
    private weak var navigationController: UINavigationController?
    private let dependencies: DetailFlowCoordinatorDependencies
    
    // MARK: Init
    
    init(navigationController: UINavigationController,
         dependencies: DetailFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let actions = DetailViewModelActions()
        let vc = dependencies.makeDetailViewController(actions: actions)
        let nc = UINavigationController(rootViewController: vc)
        navigationController?.present(nc, animated: true)
    }
}


