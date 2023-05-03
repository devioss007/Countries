//
//  SearchRootView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit
import RxSwift
import SnapKit

final class SearchRootView: NiblessView {
    
    // MARK: - Properties
    
    private let viewModel: SearchViewModel
    private let bag = DisposeBag()
    private var hierarchyNotReady = true
    
    // MARK: - Init
    
    init(viewModel: SearchViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    // MARK: UI Components
        
    private lazy var tableView: CountriesTableView = {
        let tableView = CountriesTableView()
        tableView.callBack = { [weak self] country in
            self?.viewModel.didSelectRowAt(country)
        }
        return tableView
    }()
    
    private let noFoundView = NoFoundView()
    
}

extension SearchRootView: RootView {
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else { return }
        configureView()
        hierarchyNotReady = false
    }
    
    func configureAppearance() {
        backgroundColor = .systemBackground
    }
    
    func constructHierarchy() {
        addSubview(tableView)
        addSubview(noFoundView)
    }
    
    func activateConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalToSuperview()
        }
        
        noFoundView.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupBindings() {
        viewModel.items.subscribe { [weak self] items in
            self?.tableView.setContent(items)
        }.disposed(by: bag)
        
        viewModel.isVisibleNoFoundView.subscribe { [weak self] isVisible in
            guard let self = self else { return }
            isVisible ? self.noFoundView.show() : self.noFoundView.hide()
        }.disposed(by: bag)
    }
}
