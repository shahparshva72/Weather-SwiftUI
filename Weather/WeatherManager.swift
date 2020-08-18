//
//  WeatherManager.swift
//  Weather
//
//  Created by Parshva Shah on 8/17/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import Foundation

class WeatherManager {
    func getWeather(city: String,completion: @escaping (WeatherData) -> Void) {
        guard let url = URL.urlForWeatherFor(city: city) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let json = try? JSONDecoder().decode(WeatherData.self, from: data)
            if let json = json {
                DispatchQueue.main.async {
                    completion(json)
                }
            }
            
        }.resume()
    }
}
