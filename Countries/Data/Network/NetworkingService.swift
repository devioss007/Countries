//
//  NetworkingService.swift
//  Countries
//
//  Created by Zekhniddin Jumaev on 03/05/23.
//

import Foundation

protocol AllCountriesProtocol {
    func performRequest(type: RequestType, competion: @escaping (Result<[Country], Error>) -> (Void))
}

protocol SearchCountryProtocol {
    func searchCountry(name: String, competion: @escaping (Result<[Country], Error>) -> (Void))
}

final class NetworkingService: AllCountriesProtocol, SearchCountryProtocol {

    func performRequest(type: RequestType, competion: @escaping (Result<[Country], Error>) -> (Void)) {
        let urlString: String

        switch type {
        case .all:
            urlString = Endpoints.base_URL + RequestType.all.rawValue
        case .africa:
            urlString = Endpoints.base_URL + Endpoints.SubEndpoints.region + RequestType.africa.rawValue
        case .america:
            urlString = Endpoints.base_URL + Endpoints.SubEndpoints.region + RequestType.america.rawValue
        case .asia:
            urlString = Endpoints.base_URL + Endpoints.SubEndpoints.region + RequestType.asia.rawValue
        case .europe:
            urlString = Endpoints.base_URL + Endpoints.SubEndpoints.region + RequestType.europe.rawValue
        case .oceania:
            urlString = Endpoints.base_URL + Endpoints.SubEndpoints.region + RequestType.oceania.rawValue
        }
        
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }

            do {
                let response = try JSONDecoder().decode([Country].self, from: data)
                competion(.success(response))
            } catch {
                competion(.failure(error))
            }
        }
        
        task.resume()
    }

    func searchCountry(name: String, competion: @escaping (Result<[Country], Error>) -> (Void)) {
        let encodedText = name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let urlString: String = String(format: "%@%@%@", Endpoints.base_URL, Endpoints.SubEndpoints.search, encodedText)
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else { return }

            do {
                let response = try JSONDecoder().decode([Country].self, from: data)
                competion(.success(response))
            } catch {
                competion(.failure(error))
            }
        }
        
        task.resume()
    }
}
