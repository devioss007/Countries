//
//  HomeViewModel.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import RxSwift
import RxCocoa

struct HomeViewModelActions {
    let routeToDetail: (Country) -> Void
    let routeToSearch: () -> ()
}

protocol HomeViewModelInput {
    func viewDidLoad()
    func indexOfSegmentControllChanged(_ index: Int)
    func didSelectRowAt(_ item: Country)
    func searchButtonTapped()
}

protocol HomeViewModelOutput {
    var items: BehaviorRelay<[Country]> { get }
}

final class HomeViewModel: HomeViewModelInput, HomeViewModelOutput {
    
    // MARK: Dependencies

    private let actions: HomeViewModelActions
    private let service: AllCountriesProtocol
    
    // MARK: Init
    
    init(actions: HomeViewModelActions, networkingService: AllCountriesProtocol) {
        self.actions = actions
        self.service = networkingService
    }
    
    // MARK: Output
    
    let items: BehaviorRelay<[Country]> = .init(value: [])
    
    // MARK: Private functions
    
    private func performRequest(_ index: Int = 0) {
        var region: RequestType = .africa
        switch index {
        case 0: region = .africa
        case 1: region = .america
        case 2: region = .asia
        case 3: region = .europe
        case 4: region = .oceania
        default: break
        }
        
        service.performRequest(type: region) { [weak self] result in
            switch result {
            case .success(let success):
                self?.items.accept(success.sorted { $0.name.common < $1.name.common })
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: INPUT

extension HomeViewModel {
    func viewDidLoad() {
        performRequest()
    }
    
    func indexOfSegmentControllChanged(_ index: Int) {
        performRequest(index)
    }
    
    func didSelectRowAt(_ item: Country) {
        actions.routeToDetail(item)
    }
    
    func searchButtonTapped() {
        actions.routeToSearch()
    }
}
