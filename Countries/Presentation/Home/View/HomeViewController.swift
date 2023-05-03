//
//  HomeViewController.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class HomeViewController: NiblessViewController {
    
    //MARK: - Properties
    
    let viewModel: HomeViewModel
    
    // MARK: Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: NavigationBar Items
    
    private var segmentedControl: TableViewSegmentedControl!
    
    // MARK: - View lifecycle
    
    override func loadView() {
        view = HomeRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl = TableViewSegmentedControl(viewModel: viewModel)
        navigationItem.titleView = segmentedControl
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        viewModel.viewDidLoad()
    }
    
    @objc func searchButtonTapped() {
        viewModel.searchButtonTapped()
    }

}
