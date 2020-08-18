//
//  WeatherModel.swift
//  Weather
//
//  Created by Parshva Shah on 8/17/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import SwiftUI

class WeatherModel: ObservableObject {
    
    @Published private var weather: WeatherData?
    
    var name: String {
        guard let name = weather?.name else {
            return ""
        }
        return name
    }
    
    var temperature: String {
        guard let temp = weather?.main.temp else {
            return "0.0"
        }
        return String(format: "%.1f", temp)
    }
    
    var conditionId: Int {
        guard let conditionId = weather?.weather[0].id else {
            return 404
        }
        return conditionId
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
    
    var conditionDescription: String {
        guard let desc = weather?.weather[0].description else {
            return ""
        }
        return desc
    }
    
    func getWeatherData(city: String) {
        
        guard let city = city.encoded() else {
            fatalError("URL is invalid!")
        }
        
        WeatherManager().getWeather(city: city) { (weather) in
            self.weather = weather
        }
    }
}
