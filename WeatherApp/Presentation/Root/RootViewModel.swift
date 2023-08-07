//
//  RootViewModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import Foundation
import CoreLocation

final class RootViewModel : ObservableObject {
    //MARK: -Properties
    let repository : RepositoryImplementationProtocol
    @Published var forecast : WeatherModel? 
    @Published var forecastByDay : [WeatherModel] = []
    
    init(repository: RepositoryImplementationProtocol) {
        self.repository = repository
    }
    
    //MARK: -Methods
    //The function that gets the data for each day from the array. Each day has 8 data elements so need to iterate for each one using the data to distinguish, and get the max and min temperature each day
    func getTheWeatherForEachDayFronForecast (forecast : WeatherModel) {
        //Declare the variables that we need to get the info
        var date = forecast.weatherDataArray[0].date
        var maxTemp = forecast.weatherDataArray[0].maxTemperature
        var minTemp = forecast.weatherDataArray[0].minTemperature
        var forcastByDayIndex = 0
        //Start the loop
        for index in stride (from:0,to: forecast.weatherDataArray.count, by: 1){
            //Each day has 8 elements so if the index is 0 (the loop starts with current day) or is multiple of 8 (24 hours), add the element in the new array
            if index == 0 || index.isMultiple(of: 8){
                forecastByDay.append(WeatherModel(cityName: forecast.cityName, weatherDataArray: [forecast.weatherDataArray[forcastByDayIndex]]))
            }
            //Compare the data of all the elements distinguished by date to obtain the max and min temperature of each day
            if date == forecast.weatherDataArray[index].date {
                if maxTemp < forecast.weatherDataArray[index].maxTemperature{
                    maxTemp = forecast.weatherDataArray[index].maxTemperature
                }
                if minTemp > forecast.weatherDataArray[index].minTemperature{
                    minTemp = forecast.weatherDataArray[index].minTemperature
                }
            }else{
                //When the date is different, so the day has changed, must change the date to compare an modify the added with information with the previously obtained.
                date = forecast.weatherDataArray[index].date
                forecastByDay[forcastByDayIndex].weatherDataArray[0].minTemperature = minTemp
                forecastByDay[forcastByDayIndex].weatherDataArray[0].minTemperature = minTemp
                forcastByDayIndex = forcastByDayIndex + 1
                //At last, reset the variables
                maxTemp = 0
                minTemp = 40
            }
        }
    }
}
//MARK: -RootViewModelProtocol
//The function that starts the call to the repository using a city name
extension RootViewModel : RootViewModelProtocol {
    func getForecastWeatherDataFromRepository (cityName : String) {
        //Remove white spaces
        let name = cityName.replacingOccurrences(of: K.Literals.blankSpace, with: K.Literals.apiSymbol)
        //Call the method
        repository.getDataWeatherFromName(fromName: name) { repositoryForecast, error in
            guard let forecast = repositoryForecast else {
                return
            }
            //Assign the data
            self.forecast = forecast
            //Call the function to get data per day
            self.getTheWeatherForEachDayFronForecast(forecast: forecast)
        }
    }
    
    //The function that initiates the call to the repository using the location
    func getDataWeatherFromLocation(latitude : CLLocationDegrees, longitude : CLLocationDegrees, testCompletion: ((WeatherModel?)->())?){
       DispatchQueue.main.async {
        Task {
                guard let forecast = try? await self.repository.getDataWeatherFromLocation(latitude: latitude, longitude: longitude) else {
                    return
                }
                self.forecast = forecast
                testCompletion?(forecast)
                self.getTheWeatherForEachDayFronForecast(forecast: forecast)
            }
       }
    }
}
