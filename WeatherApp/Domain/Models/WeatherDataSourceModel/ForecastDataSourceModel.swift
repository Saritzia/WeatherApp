//
//  WeatherDataSourceModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The data model that is provided from the API.
//All propierties must be named as JSON's.
struct ForecastDataSourceModel : Codable, Equatable {
    static func == (lhs: ForecastDataSourceModel, rhs: ForecastDataSourceModel) -> Bool {
        return lhs.city == rhs.city && lhs.list == rhs.list
    }
    
    let list : [List]
    let city : City
}

struct List : Codable, Equatable {
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.dt == rhs.dt && lhs.main == rhs.main  && lhs.weather == rhs.weather
    }
    
    let dt : Date
    let main : Main
    let weather : [Weather]
}

struct City : Codable, Equatable {
    let name : String
}

struct Main : Codable, Equatable {
    let temp : Double
    let temp_min : Double
    let temp_max : Double
}

struct Weather : Codable, Equatable {
    let id : Int
    let description : String
}



