//
//  Protocols.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import Foundation

protocol NameSarchedRemoteDataSourceProtocol {
    func getWeatherAPIModel(cityName : String) async throws -> WeatherDataSourceModel
}
