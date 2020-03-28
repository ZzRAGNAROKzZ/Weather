//
//  Weather.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let hourly: WeatherHourly
    //var daily: String

    enum decodingKeys: String, CodingKey {
        case hourly
        //case daily
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: decodingKeys.self)
        hourly = try container.decode(WeatherHourly.self, forKey: .hourly)
    }
}
