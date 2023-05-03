//
//  CountriesTableView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class CountriesTableView: UITableView {
    
    var callBack: ((Country) -> ())?
        
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
        separatorStyle = .none
        dataSource = self
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var items = [Country]()
    
    func setContent(_ items: [Country]) {
        self.items = items
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

extension CountriesTableView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID, for: indexPath) as? MainTableViewCell else {
            fatalError("Problem in finding a correspond cell.")
        }
        cell.setContent(items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        callBack?(items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 80 }
}

