//
//  MockRepository.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 5/8/23.
//

import Foundation
@testable import WeatherApp

final class MockRepository : RepositoryImplementationProtocol {
    let gotData : Bool
    let weather = WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200, description: "cloud")])
    
    init(gotData: Bool) {
        self.gotData = gotData
    }
    
    func getDataWeather(fromName cityName: String, completion: @escaping (WeatherApp.WeatherModel?, WeatherApp.NetworkError?) -> ()) {
        switch gotData {
        case true : completion(weather,nil)
        case false : completion(nil, .other)
        }
    }
}
