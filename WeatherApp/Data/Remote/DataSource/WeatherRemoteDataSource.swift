//
//  RemoteDataSource.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation
import CoreLocation


//An enum containing all the possible errors.
enum NetworkError : Error { case malFormedURL, noData, errorCode(Int?), decoding, other}

//The class that calls the weather api service.
final class WeatherRemoteDataSource : WeatherRemoteDataSourceProtocol {
    
    //MARK: -Properties
    private let session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    //MARK: -Get the weather api model using the location. Async await
    func getSessionWeatherByLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees) async throws -> ForecastDataSourceModel? {
        //Get the url using the longitude and latitude values
        guard let urlUsingLocation = URL(string: "\(K.server)lat=\(latitude)&lon=\(longitude)&appid=\(K.appId)") else { throw NetworkError.malFormedURL }
        //URL request
        let urlRequest = URLRequest(url: urlUsingLocation)
        
        let (data, _) = try await session.data(for:urlRequest)
        
        let forecastDataSourceModel = try JSONDecoder().decode(ForecastDataSourceModel.self, from: data)
        
        return forecastDataSourceModel
    }
    
    //MARK: -Get the weather api model using the city name. Closure
    func getWeatherAPIModelByCityName(cityName : String, completion: @escaping (ForecastDataSourceModel?, NetworkError?)->()) {
        //Get the URL using the city name
        guard let urlUsingCityName = URL(string: "\(K.server)q=\(cityName)&appid=\(K.appId)") else {
            return
        }
        //URL request
        let urlRequest = URLRequest(url: urlUsingCityName)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
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
