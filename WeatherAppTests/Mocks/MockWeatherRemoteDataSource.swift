//
//  MockWeatherRemoteDataSource.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation
@testable import WeatherApp

final class MockWeatherRemoteDataSource : NameSarchedRemoteDataSourceProtocol {
    //MARK: -Properties
    var weatherGotPossibility : Bool
    var forecastRemoteDataSourceModel : ForecastDataSourceModel = ForecastDataSourceModel(list: [List(dt: Date(timeIntervalSince1970: 1690902000), main: Main(temp: 310.15, temp_min: 32, temp_max: 37), weather: [Weather(id: 200, description: "cloud")])], city:City(name: "Madrid"))
    
    
    init(weatherGotPossibility: Bool) {
        self.weatherGotPossibility = weatherGotPossibility
    }
    
    //MARK: -Methods
    func getWeatherAPIModel(cityName: String, completion: @escaping (WeatherApp.ForecastDataSourceModel?, WeatherApp.NetworkError?) -> ()) {
        switch weatherGotPossibility{
        case true : completion(forecastRemoteDataSourceModel,nil)
        case false : completion(nil, .other)
        }
    }
}
