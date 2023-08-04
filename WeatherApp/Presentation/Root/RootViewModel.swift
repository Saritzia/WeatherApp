//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation

final class RootViewModel : ObservableObject {
    
//MARK: -Properties
    let repository : RepositoryImplementationProtocol
    @Published var forecast : WeatherModel?
    @Published var forecastByDay : [WeatherModel] = []
    
    init(repository: RepositoryImplementationProtocol) {
        self.repository = repository
    }
}
//MARK: -RootViewModelProtocol
//The function that starts the call to the repository using a city name
extension RootViewModel : RootViewModelProtocol {
    func getForecastWeatherDataFromRepository (cityName : String) {
        //Remove white spaces
        let name = cityName.replacingOccurrences(of: K.Literals.blankSpace, with: K.Literals.apiSymbol)
        //Call the method
        repository.getDataWeather(fromName: name) { repositoryForecast, error in
            guard let forecast = repositoryForecast else {
                return
            }
            //Assigning the data
            self.forecast = forecast
            //Calling the function to get data per day
            self.getTheWeatherForEachDayFronForecast(forecast: forecast)
        }
    }
    
    //The function that gets the data for each day from the array. Each day has 8 data elements so the loop iterates by 8
    func getTheWeatherForEachDayFronForecast (forecast : WeatherModel) {
        for index in stride (from:0,to: forecast.weatherDataArray.count, by: 8){
            forecastByDay.append(WeatherModel(cityName: forecast.cityName, weatherDataArray: [forecast.weatherDataArray[index]]))
        }
    }
}
