//
//  HomeRootView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit
import RxSwift
import SnapKit

final class HomeRootView: NiblessView {
    
    // MARK: - Properties
    
    private let viewModel: HomeViewModel
    private let bag = DisposeBag()
    private var hierarchyNotReady = true
    
    // MARK: - Init
    
    init(viewModel: HomeViewModel, frame: CGRect = .zero) {
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
    
}

extension HomeRootView: RootView {
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else { return }
        configureView()
        hierarchyNotReady = false
    }
    
    func constructHierarchy() {
        backgroundColor = .systemBackground
        addSubview(tableView)
    }
    
    func activateConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupBindings() {
        viewModel.items.subscribe { [weak self] items in
            self?.tableView.setContent(items)
        }.disposed(by: bag)
    }
}
