//
//  MainTableViewCell.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    static let reuseID = "MainTableViewCell"
    
    private let flagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 50)
        return label
    }()
    
    private let countryName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
        addSubview(flagLabel)
        addSubview(countryName)
        flagLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        countryName.snp.makeConstraints { make in
            make.leading.equalTo(flagLabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(_ item: Country) {
        flagLabel.text = item.flag
        countryName.text = item.name.common
    }
}
