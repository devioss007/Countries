//
//  CustomScrollView.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import UIKit
import SDWebImage

final class CustomScrollView: UIScrollView {
    
    // MARK: UI Components
    
    private let contentView = UIView()
    private let officialNameLabel = CustomLabel(textAlignment: .center)
    private let flagImageView = CustomImageView()
    private let coatOfArms = CustomImageView()
    private let populationLabel = CustomLabel()
    private let landlockedLabel = CustomLabel(textAlignment: .center)
    private let capitalLabel = CustomLabel(textAlignment: .center)
    private let independentLabel = CustomLabel()
    private let startOfWeek = CustomLabel()
    private let continentsLabel = CustomLabel()
    private let mapViewCountry = CustomMapView()
    private let mapView = CustomMapView()
    private let sizeOfCountry = CustomLabel()
    
    // MARK: Life Cycle Methods
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureAppearance()
        constructHierarchy()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal UI Functions
    
    private func configureAppearance() {
        backgroundColor = .systemBackground
    }
    
    private func constructHierarchy() {
        addSubview(contentView)
        contentView.addSubview(officialNameLabel)
        contentView.addSubview(flagImageView)
        contentView.addSubview(coatOfArms)
        contentView.addSubview(populationLabel)
        contentView.addSubview(landlockedLabel)
        contentView.addSubview(mapViewCountry)
        contentView.addSubview(capitalLabel)
        contentView.addSubview(mapView)
        contentView.addSubview(continentsLabel)
        contentView.addSubview(independentLabel)
        contentView.addSubview(startOfWeek)
        contentView.addSubview(sizeOfCountry)
    }
    
    private func activateConstraints() {
        contentView.snp.makeConstraints { make in
            make.centerX.width.top.bottom.equalToSuperview()
        }
        
        officialNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(officialNameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(100)
        }

        coatOfArms.snp.makeConstraints { make in
            make.top.equalTo(officialNameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(100)
        }

        populationLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(flagImageView.snp.bottom).offset(10)
        }

        landlockedLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(populationLabel.snp.bottom).offset(10)
        }
        
        mapViewCountry.snp.makeConstraints { make in
            make.top.equalTo(landlockedLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300)
        }

        capitalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(mapViewCountry.snp.bottom).offset(10)
        }
        
        mapView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(capitalLabel.snp.bottom).offset(10)
            make.height.equalTo(300)
        }

        continentsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(mapView.snp.bottom).offset(10)
        }
        
        independentLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(continentsLabel.snp.bottom).offset(10)
        }
        
        startOfWeek.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(independentLabel.snp.bottom).offset(10)
        }
        
        sizeOfCountry.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(startOfWeek.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
        }
    }
    

    func setContent(_ item: Country) {
        officialNameLabel.text = item.name.official
        flagImageView.sd_setImage(with: URL(string: item.flags.png ?? ""))
        coatOfArms.sd_setImage(with: URL(string: item.coatOfArms.png ?? ""))
        populationLabel.text = "Population Of \(item.name.common): " + String(item.population) + " people."
        landlockedLabel.text = "\(item.name.common) \(item.landlocked ? "is" : "is not") landlocked country. You can see the city on the map:"
        mapViewCountry.setContent(x: item.latlng?.first ?? 0.0, y: item.latlng?.last ?? 0.0, radius: 1_600_000, areaName: item.name.common)
        capitalLabel.text = "Capital city is \(item.capital!.first!). You can see the city on the map:"
        continentsLabel.text = "\(item.name.common) is located in the \(item.continents.first!)."
        independentLabel.text = "\(item.name.common) \((item.independent ?? false) ? "is" : "is not") independent country."
        startOfWeek.text = "Day starts with \(item.startOfWeek)."
        mapView.setContent(x: item.capitalInfo.latlng?.first ?? 0.0, y: item.capitalInfo.latlng?.last ?? 0.0, radius: 400_000, areaName: item.capital?.first ?? "")
        sizeOfCountry.text = "Territory of The \(item.name.common) is \(String(format: "%.0f", item.area ?? 100)) km²."
    }

}
