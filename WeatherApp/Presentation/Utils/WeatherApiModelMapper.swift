//
//  WeatherApiModelMapper.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 5/8/23.
//

import Foundation

struct WeatherModelMapper {
    static func map(forecast: ForecastDataSourceModel) -> WeatherModel {
        .init(cityName: forecast.city.name,
              weatherDataArray:
                forecast.list.map({ list in
                WeatherDataArray(
                    //Changing temperature from Kelvin to Celsius(°C = K − 273,15)
                    temperature: (list.main.temp - 273.15),
                    minTemperature: (list.main.temp_min - 273.15),
                    maxTemperature: (list.main.temp_max - 273.15),
                    //Using format method to change the Date from api to the whished one
                    date: DateFormatterToString.formatDateAndCastToString(date: list.dt),
                    conditionId: list.weather.first?.id ?? 200)
        })
    )}
}
