//
//  AppDIContainer.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation

final class AppDIContainer {
    
    // MARK: DIContainers of scenes
    
    func makeHomeSceneDIContainer() -> HomeSceneDIContainer {
        return HomeSceneDIContainer()
    }
}
