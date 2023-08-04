//
//  RepositoryImplementation.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation

final class RepositoryImplementation : RepositoryImplementationProtocol {
    //MARK: -Properties
    private let remoteDataSource : NameSarchedRemoteDataSourceProtocol
    
    init(remoteDataSource: NameSarchedRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    //MARK: -Methods
    //Function that gets the data from the remote data source and maps it to an APPModel
    func getDataWeather(fromName cityName : String, completion: @escaping ( WeatherModel?, NetworkError?)->()) {
        remoteDataSource.getWeatherAPIModel(cityName: cityName) { forecastResponse, error in
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
            let weatherAppModel = WeatherModelMapper.map(forecast:forecast)
            completion(weatherAppModel,nil)
        }
    }
}

//MARK: -Enum that maps the DataSourceModel
enum WeatherModelMapper {
    static func map(forecast: ForecastDataSourceModel) -> WeatherModel {
        .init(cityName: forecast.city.name,
              weatherDataArray:
                forecast.list.map({ list in
                WeatherDataArray(
                    //Changing temperature from Kelvin to Celsius(°C = K − 273,15)
                    temperature: (list.main.temp - 273.15),
                    minTemperature: list.main.temp_min,
                    maxTemperature: list.main.temp_max,
                    date: list.dt,
                    conditionId: list.weather.first?.id ?? 200,
                    description: list.weather.first?.description ?? "")
        })
    )}
}

    
    

