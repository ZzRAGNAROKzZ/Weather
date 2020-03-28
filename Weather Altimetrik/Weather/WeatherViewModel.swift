//
//  WeatherViewModel.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation

class WeatherViewModel {

    private struct K {
        static let urlParametersFormat = "%@,%@"
    }

    let latitude: String
    let longitude: String
    private(set) var weather: Weather?
    var reloadInfo: (()->())?

    init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }

    func requestWeatherData() {
        let urlParameters = String(format: K.urlParametersFormat, latitude, longitude)
        RequestManager.jsonRequest(requestType: .weather, urlParameter: urlParameters) { [weak self] result in
            guard let data = result.data else {
                return
            }

            self?.weather = try? JSONDecoder().decode(Weather.self, from: data)
            self?.reloadInfo?()
        }
    }
}
