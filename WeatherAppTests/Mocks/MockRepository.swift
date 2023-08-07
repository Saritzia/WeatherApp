//
//  MockRepository.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 5/8/23.
//

import Foundation
@testable import WeatherApp
import CoreLocation

final class MockRepository : RepositoryImplementationProtocol {
    
    let gotData : Bool
    let weather = WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)])
    
    init(gotData: Bool) {
        self.gotData = gotData
    }
    
    func getDataWeatherFromName(fromName cityName: String, completion: @escaping (WeatherApp.WeatherModel?, WeatherApp.NetworkError?) -> ()) {
        switch gotData {
        case true : completion(weather,nil)
        case false : completion(nil, .other)
        }
    }
    
    func getDataWeatherFromLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherApp.WeatherModel? {
        switch gotData {
        case true : return weather
        case false : return nil
        }
    }
}
