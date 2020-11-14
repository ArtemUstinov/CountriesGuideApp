//
//  CountriesCollectionViewController.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

import UIKit

class CountriesCollectionViewController: UICollectionViewController {
    
    //MARK: - Private properties:
    private let networkManager = NetworkManager.shared
    
    private var countries: [CountryModel] = []
    
    //MARK: - Override methods: 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let infoVC = segue.destination as! InfoViewController
        let cell = sender as! CountryViewCell
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        infoVC.countryModel = countries[indexPath.item]
    }
    
    //MARK: - Public methods:
    func fetchData() {
        
        networkManager.fetchCountries { (data) in
            self.countries.append(contentsOf: data)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension CountriesCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryViewCell
        
        cell.countryLabel.text = countries[indexPath.item].name
        
        return cell
    }
}

extension CountriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 70)
    }
}
