//
//  DetailViewController.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit
import RxCocoa
import RxSwift

final class DetailViewController: NiblessViewController {
    
    //MARK: - Properties
    
    let viewModel: DetailViewModel
    private let bag = DisposeBag()

    // MARK: Init
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        view = DetailRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setupBindings()
    }
    
    private func setNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeButtonTapped))
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    private func setupBindings() {
        viewModel.item.subscribe { [weak self] country in
            guard let country = country else { return }
            self?.title = country.name.common
        }.disposed(by: bag)
    }
}

