//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/22/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit
import AlamofireImage


class CurrentWeatherViewController: UIViewController {

    fileprivate enum State {
        case noData
        case loading
        case data(weather: WeatherData)
        case error
    }
    
    private var state = State.noData {
        didSet {
            updateUIForCurrentState()
        }
    }
    
    // MARK: DI-properties
    
    var city: City!
    var weatherService: WeatherService!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = city.name
        
        refreshButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Refresh"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(refreshButtonPressed))
        navigationItem.rightBarButtonItem = refreshButton
        
        installResultView()
        
        updateUIForCurrentState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateDataIfNeeded()
    }
    
    // MARK: Outlets
    
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var messageLabel: UILabel!
    private var weatherView: CurrentWeatherView!
    private var refreshButton: UIBarButtonItem!
    
    // MARK: Actions
    
    @objc func refreshButtonPressed() {
        updateDataIfNeeded()
    }
    
    // MARK: Utility
    
    private func installResultView() {
        guard let weatherView: CurrentWeatherView  = UIView.fromNib() else {
            assert(false)
            return
        }
        
        weatherView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(weatherView)
        
        view.addConstraint(NSLayoutConstraint(item: weatherView,
                                              attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0.0))
        
        view.addConstraint(NSLayoutConstraint(item: weatherView,
                                              attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .centerY,
                                              multiplier: 1.0,
                                              constant: 0.0))
        
        self.weatherView = weatherView
    }
    
    private func updateUIForCurrentState() {
        switch state {
        case .noData:
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            
            messageLabel.isHidden = false
            messageLabel.text = "No data"
            
            weatherView.isHidden = true
        case .loading:
            activityIndicatorView.isHidden = false
            activityIndicatorView.startAnimating()
            
            messageLabel.isHidden = true
            
            weatherView.isHidden = true
            
        case .data(let forecast):
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            
            messageLabel.isHidden = true
            
            weatherView.isHidden = false
            updateResultView(weather: forecast)
        case .error:
            activityIndicatorView.isHidden = true
            activityIndicatorView.stopAnimating()
            
            messageLabel.isHidden = false
            messageLabel.text = "Error"
        }
    }
    
    private func updateDataIfNeeded() {
        guard state != .loading else {
            return
        }
        
        state = .loading
        
        weatherService.getCurrentWeather(cityID: city.id) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success(let weather):
                strongSelf.state = .data(weather: weather)
            case .failure:
                strongSelf.state = .error
            }
        }
    }
    
    private func updateResultView(weather: WeatherData) {
        let iconURL = weatherService.defaultIconURL(iconID: weather.iconID)
        let pressure_mmHg = weather.pressure / 1.3332239
        
        weatherView.imageView.af_setImage(withURL: iconURL)
        weatherView.temperatureLabel.text =
            String(format: "%.1f°C", weather.temperature)
        weatherView.pressureLabel.text =
            String(format: "%.0f mmHg", pressure_mmHg)
        weatherView.humidityLabel.text =
            String(format: "%.0f%% humidity", weather.humidity)
        weatherView.descriptionLabel.text = weather.description
    }
}


extension CurrentWeatherViewController.State: Equatable {}

fileprivate func ==(lhs: CurrentWeatherViewController.State,
                    rhs: CurrentWeatherViewController.State) -> Bool {
    switch (lhs, rhs) {
    case (.noData, .noData):
        return true
    case (.loading, .loading):
        return true
    case (.data(let lhsData), .data(let rhsData)):
        return lhsData == rhsData
    default:
        return false
    }
}

