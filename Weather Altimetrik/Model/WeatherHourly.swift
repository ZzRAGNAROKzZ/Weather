//
//  WeatherHourly.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation

struct WeatherHourly: Decodable {
    
    enum decodingKeys: String, CodingKey {
        case summary
        case data
    }

    let summary: String
    let data: [WeatherData]

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: decodingKeys.self)
        summary = try container.decode(String.self, forKey: .summary)
        data = try container.decode([WeatherData].self, forKey: .data)
    }
}
