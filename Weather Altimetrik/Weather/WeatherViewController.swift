//
//  WeatherViewController.swift
//  Weather Altimetrik
//
//  Created by Guillermo Arturo Daniel Garcia Romero on 3/28/20.
//  Copyright © 2020 Guillermo Arturo Daniel Garcia Romero. All rights reserved.
//

import UIKit
import MSBBarChart


class WeatherViewController: UIViewController {

    @IBOutlet private weak var chartView: MSBBarChartView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!

    var viewModel: WeatherViewModel! {
        didSet {
            viewModel.reloadInfo = { [weak self] in
                self?.reloadChart()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.requestWeatherData()
    }

    func reloadChart() {
        guard let chartData = viewModel.weather?.hourly.data.map({Int($0.temperature)}) else {
            return
        }

        DispatchQueue.main.async {
            self.chartView.setDataEntries(values: chartData)
            self.chartView.start()
        }
    }

    @IBAction func didChangedSegmentedControl(_ sender: Any) {
        
    }

}
