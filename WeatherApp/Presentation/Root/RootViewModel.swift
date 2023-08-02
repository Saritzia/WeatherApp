//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation

final class RootViewModel : ObservableObject {
    
//MARK: -Properties
    private let repository : RepositoryImplementationProtocol
    @Published var forecast : WeatherModel?
    
    init(repository: RepositoryImplementationProtocol) {
        self.repository = repository
    }
}
//MARK: -RootViewModelProtocol
extension RootViewModel : RootViewModelProtocol {
    func getForecastWeatherDataFromRepository (cityName : String) {
        repository.getDataWeather(fromName: cityName) { repositoryForecast, error in
            guard error == nil else {
                return
            }
            self.forecast = repositoryForecast
        }
    }
}
