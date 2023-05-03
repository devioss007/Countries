//
//  Country.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation
//https://restcountries.com/
struct Country: Codable {
    let name: CommonInfo
    let flag: String
    let subregion: String
    let landlocked: Bool
    let population: Int
    let flags, coatOfArms: CoatOfArms
    let capital: [String]?
    let continents: [String]
    let independent: Bool?
    let startOfWeek: String
    let capitalInfo: CapitalInfo
    let latlng: [Double]?
    let area: Double?
}

struct CommonInfo: Codable {
    let common: String
    let official: String
}

struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

struct CapitalInfo: Codable {
    let latlng: [Double]?
}

