//
//  Protocols.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation
import CoreLocation

//MARK: -Weather data source protocol
protocol WeatherRemoteDataSourceProtocol {
    func getWeatherAPIModelByCityName(cityName : String, completion: @escaping (ForecastDataSourceModel?, NetworkError?)->())
    func getSessionWeatherByLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> ForecastDataSourceModel? 
}

//MARK: -Repository protocol
protocol RepositoryImplementationProtocol {
    func getDataWeatherFromName(fromName cityName : String, completion: @escaping (WeatherModel?, NetworkError?)->())
    func getDataWeatherFromLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> WeatherModel?
}

//MARK: -RootVM protocol
protocol RootViewModelProtocol {
    var forecast : WeatherModel? { get }
    var forecastByDay : [WeatherModel] { get }
    func getForecastWeatherDataFromRepository(cityName : String)
    func getDataWeatherFromLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws
}
