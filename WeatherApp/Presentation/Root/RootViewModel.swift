//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation
import CoreLocation

final class RootViewModel : ObservableObject, RootViewModelProtocol {
    //MARK: -Properties
    let repository : RepositoryImplementationProtocol
    @Published var forecast : WeatherModel?
    @Published var forecastByDay : [WeatherModel] = []
    
    init(repository: RepositoryImplementationProtocol) {
        self.repository = repository
    }
    
    //MARK: -Methods
    func getForecastWeatherDataFromRepository (cityName : String, testCompletion: ((WeatherModel?,[WeatherModel]?)->())?) {
        //Remove white spaces
        let name = cityName.replacingOccurrences(of: K.Literals.blankSpace, with: K.Literals.apiSymbol)
        //Call the method
        self.repository.getDataWeatherFromName(fromName: name) { repositoryForecast, error in
            DispatchQueue.main.async{
                Task{
                    guard let resultForecast = repositoryForecast else {
                        return
                    }
                    //Assign the data
                    self.forecast = resultForecast
                    //Call the function to get data per day
                    self.forecastByDay = GetForecastMethod.getTheWeatherForEachDayFromForecast(forecast: resultForecast)
                    testCompletion?(resultForecast, self.forecastByDay)
                }
            }
        }
    }
    
    //The function that initiates the call to the repository using the location
    func getDataWeatherFromLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees, testCompletion: ((WeatherModel?,[WeatherModel]?)->())?){
        DispatchQueue.main.async {
            Task {
                guard let forecast = try? await self.repository.getDataWeatherFromLocation(latitude: latitude, longitude: longitude) else {
                    return
                }
                self.forecast = forecast
                self.forecastByDay = GetForecastMethod.getTheWeatherForEachDayFromForecast(forecast: forecast)
                testCompletion?(forecast, self.forecastByDay)
            }
        }
    }
}
