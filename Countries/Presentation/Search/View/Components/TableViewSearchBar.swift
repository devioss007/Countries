//
//  TableViewSearchBar.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit

final class TableViewSearchBar: UISearchBar {
    private var vm: SearchViewModel!
    
    convenience init(viewModel: SearchViewModel) {
        self.init(frame: .zero)
        delegate = self
        placeholder = "Country name..."
        self.vm = viewModel
    }
}

extension TableViewSearchBar: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
        
        if let text = searchBar.text, !text.isEmpty {
            vm.searchButtonTapped(with: text)
        }
    }
}
