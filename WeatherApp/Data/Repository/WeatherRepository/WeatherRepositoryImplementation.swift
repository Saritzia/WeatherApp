//
//  RepositoryImplementation.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation
import CoreLocation

final class RepositoryImplementation : RepositoryImplementationProtocol {
    //MARK: -Properties
    private let remoteDataSource : WeatherRemoteDataSourceProtocol
    
    init(remoteDataSource: WeatherRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    //MARK: -Get data by city name. Closure
    func getDataWeatherFromName(fromName cityName : String, completion: @escaping ( WeatherModel?, NetworkError?)->()) {
        remoteDataSource.getWeatherAPIModelByCityName(cityName: cityName) { forecastResponse, error in
            guard let forecast = forecastResponse else {
                completion(nil,NetworkError.noData)
                switch error{
                case .decoding : print(K.Literals.errorDecoding)
                case .errorCode(let errorCode) :print("\(K.Literals.error) \(String(describing: errorCode))")
                case .malFormedURL : print(K.Literals.invalidURL)
                case .noData : print(K.Literals.dataNotfound)
                default : print(K.Literals.error)
                }
                return
            }
            //Call the custom map method to get de weather app model
            let weatherAppModel = WeatherModelMapper.map(forecast:forecast)
            completion(weatherAppModel,nil)
        }
    }
    
    //MARK: -Get data by location. Async await
    func getDataWeatherFromLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> WeatherModel? {
        
        guard let weatherDataSourceModel = try? await remoteDataSource.getSessionWeatherByLocation(latitude: latitude, longitude: longitude) else {throw NetworkError.other}
        
        //Call the custom map method to get de weather app model
        let weatherModel = WeatherModelMapper.map(forecast: weatherDataSourceModel)
        
        return weatherModel
    }
}


    

