//
//  ViewController.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import UIKit

class LocationFormViewController: UIViewController {

    private struct K {
        static let weatherSegueId = "weatherSegue"
    }

    @IBOutlet private weak var latitudTextfield: UITextField!
    @IBOutlet private weak var longitudeTextfield: UITextField!
    let viewModel = LocationFormViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSearchButton(_ sender: Any) {
        guard let latitude = latitudTextfield.text, let longitude = longitudeTextfield.text, !latitude.isEmpty, !longitude.isEmpty else {
            showAlert(title: "Latitude and Longitude shouldn't be empty")
            return
        }

        guard viewModel.validateCoordinates(latitude: latitude, longitude: longitude) else {
            showAlert(title: "Incorrect latitude and longitude values", message: "Latitude should have a value between -90 and 90 \n Longitude should have a value between -180 and 180 ")
            return
        }

        performSegue(withIdentifier: K.weatherSegueId, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let latitude = latitudTextfield.text, let longitude = longitudeTextfield.text else {
            return
        }

        let weatherVC = segue.destination as? WeatherViewController
        weatherVC?.viewModel = WeatherViewModel(latitude: latitude, longitude: longitude)
    }
}



