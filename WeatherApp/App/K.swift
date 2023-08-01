//
//  K.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The constant struct with all the string values or sensible variables used in the app.

struct K {
    
    static let server = "https://api.openweathermap.org/data/2.5/forecast?"
    static let appId = "b359c3499f4947ec6b4e4ec31dda9b99"
    
    struct ModelConditionName {
        static let cloudBolt = "cloud.bolt"
        static let cloudDrizzle = "cloud.drizzle"
        static let cloudRain = "cloud.rain"
        static let cloudSnow = "cloud.snow"
        static let cloudFog = "cloud.fog"
        static let sunMax = "sun.max"
        static let cloud = "cloud"
    }
    
}
