//
//  WeatherData.swift
//  Weather
//
//  Created by Parshva Shah on 8/15/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
