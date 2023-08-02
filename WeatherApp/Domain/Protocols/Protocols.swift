//
//  Protocols.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

protocol NameSarchedRemoteDataSourceProtocol {
   // func getWeatherAPIModel(cityName : String) async throws -> ForecastDataSourceModel
    func getWeatherAPIModel(cityName : String, completion: @escaping (ForecastDataSourceModel?, NetworkError?)->())
}

protocol RepositoryImplementationProtocol {
    func getDataWeather(fromName cityName : String, completion: @escaping (WeatherModel?, NetworkError?)->()) 
}

protocol RootViewModelProtocol {
    func getForecastWeatherDataFromRepository(cityName : String)
}
