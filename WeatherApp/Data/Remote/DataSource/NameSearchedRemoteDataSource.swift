//
//  RemoteDataSource.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The class that calls the api service using the city name.

//An enum containing all the possible errors.
enum NetWorkError : Error { case malFormedURL, noData, errorCode, decodind, other}

final class NameSarchedRemoteDataSource {
    
    //MARK: -Properties
    private let session : URLSession = URLSession.shared
    
    //MARK: -getSessionWeather method
    func getSessionWeather(cityName : String) -> URLRequest? {
        //Get the URL using the city name passed as a parameter
        guard let urlUsingCityName = URL(string: "\(K.server)&q=\(cityName)") else {
            return nil
        }
        //URL request
        var urlRequest = URLRequest(url: urlUsingCityName)
        return urlRequest
    }
    
    //MARK: -getWeatherAPIModel method
    func getWeatherAPIModel(cityName : String) async throws -> WeatherDataSourceModel {
        //Try to get the url or throw an error because the url could not be formed.
        guard let url = getSessionWeather(cityName: cityName) else {
            throw NetWorkError.malFormedURL
        }
        //Perform the call and get the data
        let (data,_) = try await URLSession.shared.data(for: url)
        
        let cityNameWeatherDataSourceModel = try JSONDecoder().decode(WeatherDataSourceModel.self, from: data)
        
        return cityNameWeatherDataSourceModel
    }
}
