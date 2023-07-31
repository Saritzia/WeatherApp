//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The model which information will be used in the app.

struct WeatherModel {
    
    let conditionId : Int
    let cityName : String
    let temperature : Float
    let minTemperature : Float
    let maxTemperature : Float
    let suntise : Int
    let sunshine : Int
    
    var conditionName : String {
        switch conditionId {
        case 200...232 : return K.ModelConditionName.cloudBolt
        case 300...321 : return K.ModelConditionName.cloudDrizzle
        case 500...531 : return K.ModelConditionName.cloudRain
        case 600...622 : return K.ModelConditionName.cloudSnow
        case 701...781 : return K.ModelConditionName.cloudFog
        case 800 : return K.ModelConditionName.sunMax
        case 801...804 : return K.ModelConditionName.cloudBolt
        default: return K.ModelConditionName.cloud
        } 
    }
}
