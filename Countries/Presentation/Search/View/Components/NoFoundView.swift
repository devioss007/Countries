//
//  NoFoundView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 04/05/23.
//

import UIKit

final class NoFoundView: NiblessView {
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Sorry, We cannot find the country 🤷"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    func show() {
        DispatchQueue.main.async {
            self.isHidden = false
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.isHidden = true
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        isHidden = true
    }
}

