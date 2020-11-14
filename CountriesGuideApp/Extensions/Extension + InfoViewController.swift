//
//  Extension + InfoViewController.swift
//  CountriesGuideApp
//
//  Created by Артём Устинов on 14.11.2020.
//  Copyright © 2020 Artem Ustinov. All rights reserved.
//

import Spring

extension InfoViewController {
    
    func getAnimationLabels() {
        setAnimation(label: nameLabel, animation: "slideLeft")
        setAnimation(label: capitalLabel, animation: "slideLeft")
        setAnimation(label: regionLabel, animation: "slideLeft")
        
        setAnimation(label: populationLabel, animation: "squeezeLeft")
        setAnimation(label: languageLabel, animation: "fadeInRight")
        setAnimation(label: codeLabel, animation: "squeezeLeft")
        setAnimation(label: nameCodeLabel, animation: "fadeInRight")
        setAnimation(label: symbolLabel, animation: "fadeInUp")
    }
    
    private func setAnimation(label: SpringLabel, animation: String) {
        
        flagImage.animation = "swing"
        flagImage.delay = 0.1
        flagImage.duration = 1
        flagImage.animate()
        
        label.animation = animation
        label.duration = 1
        label.delay = 0.3
        label.animate()
    }
}
