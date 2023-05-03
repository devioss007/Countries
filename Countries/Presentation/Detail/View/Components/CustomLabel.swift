//
//  CustomLabel.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit

final class CustomLabel: UILabel {
    init(textAlignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 18)
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
