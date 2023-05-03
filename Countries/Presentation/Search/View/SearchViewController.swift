//
//  SearchViewController.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit

final class SearchViewController: NiblessViewController {
    
    //MARK: - Properties
    
    let viewModel: SearchViewModel
    
    // MARK: Init
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: NavigationBar Items
    
    private var searchBar: TableViewSearchBar!
    
    // MARK: - View lifecycle
    
    override func loadView() {
        view = SearchRootView(viewModel: viewModel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar = TableViewSearchBar(viewModel: viewModel)
        navigationItem.titleView = searchBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.searchBar.becomeFirstResponder()
        }
    }
}

