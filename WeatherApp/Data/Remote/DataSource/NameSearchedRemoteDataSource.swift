//
//  RemoteDataSource.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

//The class that calls the api service using the city name.

//An enum containing all the possible errors.
enum NetworkError : Error { case malFormedURL, noData, errorCode(Int?), decoding, other}

final class NameSarchedRemoteDataSource : NameSarchedRemoteDataSourceProtocol {
    
    //MARK: -Properties
    private let session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    //MARK: -getSessionWeather method
    func getSessionWeather(cityName : String) -> URLRequest? {
        //Get the URL using the city name passed as a parameter
        guard let urlUsingCityName = URL(string: "\(K.server)q=\(cityName)&appid=\(K.appId)") else {
            return nil
        }
        //URL request
        let urlRequest = URLRequest(url: urlUsingCityName)
        return urlRequest
    }
    
    //MARK: -getWeatherAPIModel method
    func getWeatherAPIModel(cityName : String, completion: @escaping (ForecastDataSourceModel?, NetworkError?)->()) {
        //Try to get the url or throw an error because the url could not be formed.
        guard let url = getSessionWeather(cityName: cityName) else {
            print(URLError(.badURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            //Check all the parameters
            guard error == nil else {
                completion(nil,.other)
                return
            }
            guard let data = data else {
                completion(nil,.noData)
                return
            }
            guard let httpResponse = ((response) as? HTTPURLResponse),
                  httpResponse.statusCode == 200 else {
                let statusCode = ((response) as? HTTPURLResponse)?.statusCode
                completion(nil,.errorCode(statusCode))
                return
            }
            guard let forecastResponse = try? JSONDecoder().decode(ForecastDataSourceModel.self, from: data) else {
                completion(nil,.decoding)
                return
            }
            completion(forecastResponse,nil)
        }
        task.resume()
    }
}
