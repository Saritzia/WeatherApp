//
//  Protocols.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

protocol NameSarchedRemoteDataSourceProtocol {
    func getWeatherAPIModel(cityName : String, completion: @escaping (ForecastDataSourceModel?, NetworkError?)->())
}

protocol RepositoryImplementationProtocol {
    func getDataWeather(fromName cityName : String, completion: @escaping (WeatherModel?, NetworkError?)->()) 
}

protocol RootViewModelProtocol {
    var forecast : WeatherModel? { get }
    var forecastByDay : [WeatherModel] { get }
    func getForecastWeatherDataFromRepository(cityName : String)
}
