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
    
    struct Views {
        static let locationSystemName = "location.circle.fill"
        static let searchSystemName = "magnifyingglass.circle"
        static let currentImage = "thermometer.sun"
        static let fiveDaysImage = "calendar.badge.exclamationmark"
        static let backgroundImage = "Background"
    }
    
    struct Literals {
        static let textInTextField = "Search..."
        static let symbol = ">>"
        static let noDate = "No date"
        static let get = "GET"
        static let errorDecoding = "Error decoding data"
        static let error = "Error"
        static let invalidURL = "URL not valid"
        static let dataNotfound = "Error, data not found"
        static let ahora = "Ahora"
        static let fiveDays = "5 días"
        static let blankSpace = " "
        static let apiSymbol = "%20"
        static let city = "Ciudad"
        static let cloud = "cloud"
        static let defaultTemperature = "0.0ºC"
    }
    
    struct ImageApi{
        static let server = "https://api.teleport.org/api/urban_areas/"
        static let fromBlankToSymbol = "-"
    }
}
