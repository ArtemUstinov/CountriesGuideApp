//
//  InfoViewController.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

import SVGKit
import Spring

class InfoViewController: UIViewController {
    
    //MARK: - IBOutlets:
    @IBOutlet var flagImage: SpringImageView!
        
    @IBOutlet var nameLabel: SpringLabel!
    @IBOutlet var capitalLabel: SpringLabel!
    @IBOutlet var regionLabel: SpringLabel!
    
    @IBOutlet var populationLabel: SpringLabel!
    @IBOutlet var languageLabel: SpringLabel!
    @IBOutlet var codeLabel: SpringLabel!
    @IBOutlet var nameCodeLabel: SpringLabel!
    @IBOutlet var symbolLabel: SpringLabel!
    
    //MARK: - Public properties:
    var countryModel: CountryModel!

    //MARK: - Override methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabels()
        setImage()
        getAnimationLabels()
    }
    
    //MARK: - Private methods:
    private func setLabels() {
        
        nameLabel.text = "Country: \(countryModel.name ?? "")"
        capitalLabel.text = "Capital: \(countryModel.capital ?? "")"
        regionLabel.text = "Region: \(countryModel.region ?? "")"
        
        populationLabel.text = "Population: \(countryModel.population ?? 0)"
        
        for language in countryModel.languages {
            languageLabel.text = "Language: \(language.name ?? "")"
        }
        
        for currencie in countryModel.currencies {
            codeLabel.text = "Code: \(currencie.code ?? "")"
            nameCodeLabel.text = "Name of money: \(currencie.name ?? "")"
            symbolLabel.text = "Symbol of money: \(currencie.symbol ?? "")"
        }
    }
    
    private func setImage() {
        
        guard let urlString = countryModel.flag else { return }
        guard let url = URL(string: urlString) else { return }
        guard let convertToJpg = SVGKImage(contentsOf: url) else { return }
        flagImage.image = convertToJpg.uiImage
    }
}
