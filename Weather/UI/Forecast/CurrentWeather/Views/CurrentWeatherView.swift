//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/23/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


class CurrentWeatherView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}
