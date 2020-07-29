//
//  Model.swift
//  MMParser
//
//  Created by Mahsa Mo on 5/8/1399 AP.
//  Copyright © 1399 Mahsa Mo. All rights reserved.
//

import Foundation

struct AppConstants {
    static let countryByCodeURL = "https://restcountries-v1.p.rapidapi.com/callingcode/"
}






// MARK: - CountryModel
struct Country: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region, subregion: String
    let population: Int
    let latlng: [Int]
    let demonym: String
    let area: Int
    let gini: Double
    let timezones, borders: [String]
    let nativeName, numericCode: String
    let currencies, languages: [String]
    let translations: Translations
    let relevance: String
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String
    let it: String
}

typealias Response = [Country]










// MARK: Mapper Initialization
struct Mapper {
    
    init() {
    }
    func mapp(jsString: String) -> Any {
        if let jsonData = jsString.data(using: .utf8) {
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(Response.self, from: jsonData)
                
                return model
                
            }catch {
                print(error.localizedDescription)
            }
            
        }else {
            
        }
        return "Error"
    }
}
