//
//  StartViewController.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    //MARK: - IBOutlets:
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text =
            """
            Do you know all European countries?
            
            No?
            
            Then press the button ⬇️
            """
        }
    }
    
    //MARK: - Override methods:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let countriesVC = segue.destination as! CountriesCollectionViewController
        countriesVC.fetchData()
    }
}

