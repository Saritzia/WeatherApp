//
//  WeatherDataSourceModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The data model that is provided from the API.
//All propierties must be named as JSON's.

struct WeatherDataSourceModel : Codable {
    let name : String
    let main : Main
    let weather : [Weather]
    let sys : Sys
}

struct Main : Codable {
    let temp : Float
    let temp_min : Float
    let tem_mac : Float
}

struct Weather : Codable {
    let id : Int
    let description : String
}

struct Sys : Codable {
    let sunrise : Int
    let sunset : Int
}
