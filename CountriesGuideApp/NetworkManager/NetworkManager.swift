//
//  NetworkManager.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

import UIKit

class NetworkManager {
    
    //MARK: - Public properties:
    static let shared = NetworkManager()
    
    //MARK: - Private properties:
    private let urlString = "https://restcountries.eu/rest/v2/region/europe"
    
    //MARK: - Public methods:
    func fetchCountries(completionHandler: @escaping ([CountryModel]) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode([CountryModel].self, from: data)
                completionHandler(data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    private init() {}
}
