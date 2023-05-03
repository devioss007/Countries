//
//  TableViewSegmentedControl.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class TableViewSegmentedControl: UISegmentedControl {
    private var vm: HomeViewModel!
    
    convenience init(viewModel: HomeViewModel) {
        self.init(items: ["Africa", "America", "Asia", "Europe", "Oceania"])
        selectedSegmentIndex = 0
        addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        self.vm = viewModel
    }

    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        vm.indexOfSegmentControllChanged(sender.selectedSegmentIndex)
    }
}

