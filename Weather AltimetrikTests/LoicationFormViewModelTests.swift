//
//  LoicationFormViewModelTests.swift
//  Weather AltimetrikTests
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import Foundation
import XCTest
@testable import Weather_Altimetrik

class LoicationFormViewModelTests: XCTestCase {

    func testCoordinateRange() {
        let viewModel = LocationFormViewModel()
        var latitude = "-100"
        var longitude = "100"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since latitude is lower than -90")

        latitude = "100"
        longitude = "100"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since latitude is greater than 90")

        latitude = "30"
        longitude = "200"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since longitude is greater than 180")

        latitude = "30"
        longitude = "-200"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since longitude is lower than -180")

        latitude = "test"
        longitude =  "100"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since latitude is not a number")

        latitude = "30"
        longitude =  "test"

        XCTAssertFalse(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be false since longitude is not a number")

        latitude = "90"
        longitude =  "180"

        XCTAssertTrue(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be true since longitude and latitude have correct values")

        latitude = "-90"
        longitude =  "180"

        XCTAssertTrue(viewModel.validateCoordinates(latitude: latitude, longitude: longitude), "Result should be true since longitude and latitude have correct values")
    }
}
