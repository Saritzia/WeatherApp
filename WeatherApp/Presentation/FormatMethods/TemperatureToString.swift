//
//  TemperatureToString.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 5/8/23.
//

import Foundation

struct TemperatureToString {
    static func temperatureToString(temperature : Double) -> String{
            let temperature = String (format: "%.1f", temperature)
            return "\(temperature)ºC"
        }
}
