//
//  RootView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation

protocol RootView: AnyObject {
    
    func configureView()
    
    func constructHierarchy()
    
    func activateConstraints()
        
    func configureAppearance()
    
    func setupBindings()
    
}

extension RootView {
    
    func configureView() {
        configureAppearance()
        constructHierarchy()
        activateConstraints()
        setupBindings()
    }
    
    func configureAppearance() {}
        
    func setupBindings() {}
}
