//
//  DetailViewModel.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation
import RxSwift
import RxCocoa

struct DetailViewModelActions { }

protocol DetailViewModelOutput {
    var item: BehaviorRelay<Country?> { get }
}

final class DetailViewModel: DetailViewModelOutput {
    
    // MARK: Dependencies

    private let actions: DetailViewModelActions
    
    // MARK: Output
    
    var item = BehaviorRelay<Country?>(value: nil)
    
    // MARK: Init
    
    init(actions: DetailViewModelActions, country: Country) {
        self.actions = actions
        self.item.accept(country)
    }
}
