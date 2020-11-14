//
//  CountryModel.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

struct CountryModel: Decodable {
    let name: String?
    let capital: String?
    let region: String?
    let population: Int?
    let currencies: [Currencies]
    let languages: [Languages]
    let flag: String?
}

struct Currencies: Decodable {
    let code: String?
    let name: String?
    let symbol: String?
}

struct Languages: Decodable {
    let name: String?
}

