//
//  Endpoints.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation

enum Endpoints {
    static let base_URL = "https://restcountries.com/v3.1/"

    enum SubEndpoints {
        static let region = "region/"
        static let search = "name/"
    }
}

enum RequestType: String {
    case all = "all"
    case africa = "Africa"
    case america = "Americas"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

