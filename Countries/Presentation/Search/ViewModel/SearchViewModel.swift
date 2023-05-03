//
//  SearchViewModel.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import RxSwift
import RxCocoa

struct SearchViewModelActions {
    let routeToDetail: (Country) -> Void
}

protocol SearchViewModelInput {
    func searchButtonTapped(with text: String)
    func didSelectRowAt(_ item: Country)
}

protocol SearchViewModelOutput {
    var items: BehaviorRelay<[Country]> { get }
    var isVisibleNoFoundView: BehaviorRelay<Bool> { get }
}

final class SearchViewModel: SearchViewModelInput, SearchViewModelOutput {
    
    // MARK: Dependencies

    private let actions: SearchViewModelActions
    private let service: SearchCountryProtocol
    
    // MARK: Init
    
    init(actions: SearchViewModelActions, networkingService: SearchCountryProtocol) {
        self.actions = actions
        self.service = networkingService
    }
    
    // MARK: Output
    
    let items: BehaviorRelay<[Country]> = .init(value: [])
    let isVisibleNoFoundView: BehaviorRelay<Bool> = .init(value: false)
    
    // MARK: Private functions

    private func performRequest(with text: String) {
        service.searchCountry(name: text) { [weak self] result in
            switch result {
            case .success(let success):
                self?.items.accept(success)
                self?.isVisibleNoFoundView.accept(false)
            case .failure(let error):
                self?.isVisibleNoFoundView.accept(true)
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: INPUT

extension SearchViewModel {
    func searchButtonTapped(with text: String) {
        performRequest(with: text)
    }
    
    func didSelectRowAt(_ item: Country) {
        actions.routeToDetail(item)
    }
}
