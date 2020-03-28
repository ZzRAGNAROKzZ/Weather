//
//  RequestManager.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation

typealias RequestResult = (isSuccessful: Bool, data: Data?, error: Error?)

enum RequestType {
    case weather

    var urlString: String {
        switch self {
        case .weather:
            return "https://api.darksky.net/forecast/05f6697fffe59977f35dd74b5c904e69/"
        }
    }

    var method: String {
        switch self {
        case .weather:
            return "GET"
        }
    }

}

final class RequestManager {

    private struct K {
        static let contentTypeKey = "Content-Type"
        static let contentTypeJsonValue = "application/json"
    }

    static func jsonRequest(requestType: RequestType, urlParameter: String, completion: @escaping ((RequestResult) -> ())) {
        guard let url = URL(string: requestType.urlString + urlParameter) else {
            completion((false, nil, nil))
            return
        }

        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.httpMethod = requestType.method
        request.setValue(K.contentTypeJsonValue, forHTTPHeaderField: K.contentTypeKey)

        session.dataTask(with: request) { (data, response, error) in
            let isSuccessful = error != nil
            completion((isSuccessful, data, error))
        }.resume()
    }
}
