//
//  URL+Extensions.swift
//  Weather
//
//  Created by Parshva Shah on 8/17/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import Foundation

extension URL {
    static func urlForWeatherFor(city: String) -> URL? {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=875271454c85a5350e7d2a1058345502&units=metric") else {
            return nil
        }
        
        return url
    }
}
