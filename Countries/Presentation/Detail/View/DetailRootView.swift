//
//  DetailRootView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit
import RxSwift
import SnapKit

final class DetailRootView: NiblessView {
    
    // MARK: - Properties
    
    private let viewModel: DetailViewModel
    private let bag = DisposeBag()
    private var hierarchyNotReady = true
    
    // MARK: - Init
    
    init(viewModel: DetailViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel
        super.init(frame: frame)
    }
    
    // MARK: UI Components
    
    private let scrollView = CustomScrollView()
}

extension DetailRootView: RootView {

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
        addSubview(scrollView)
    }
    
    func activateConstraints() {
        scrollView.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    func setupBindings() {
        viewModel.item.subscribe { [weak self] country in
            guard let country = country else { return }
            self?.scrollView.setContent(country)
        }.disposed(by: bag)
    }
}


