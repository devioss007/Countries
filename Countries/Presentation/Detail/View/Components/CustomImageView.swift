//
//  CustomImageView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class CustomImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        contentMode = .scaleAspectFit
        layer.borderWidth = 2
        layer.cornerRadius = 4
        layer.borderColor = UIColor.orange.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
