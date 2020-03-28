//
//  LocationFormViewModel.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation

class LocationFormViewModel {

    private struct K {
        static let maxLatitude = 90.0
        static let minLatitude = -90.0
        static let maxLongitude = 180.0
        static let minLongitude = -180.0
    }

    func validateCoordinates(latitude: String, longitude: String) -> Bool {
        guard let latitude = Double(latitude), let longitude = Double(longitude) else {
            return false
        }

        guard K.minLatitude ... K.maxLatitude ~= latitude, K.minLongitude ... K.maxLongitude ~= longitude else {
            return false
        }
        
        return true
    }
}
