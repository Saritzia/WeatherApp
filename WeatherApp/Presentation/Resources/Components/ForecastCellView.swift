//
//  ForecastCellView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct ForecastCellView: View {
    //MARK: -Properties
    var forecastWeatherModelDetail : WeatherModel
    
    init(forecastWeatherModelDetail: WeatherModel) {
        self.forecastWeatherModelDetail = forecastWeatherModelDetail
    }
    
    //MARK: -View
    var body: some View {
            HStack {
    //MARK: -Date text
                Text(forecastWeatherModelDetail.weatherDataArray.first?.date ?? K.Literals.noDate)
                        .font(.system(size: 22))
                        .bold()
                Spacer()
    //MARK: -Temperature text
                Text(TemperatureFormatter.temperatureToString(temperature: forecastWeatherModelDetail.weatherDataArray.first?.temperature ?? 0.0))
                        .font(.system(size: 22))
                        .bold()
                Spacer()
    //MARK: -Weather image
                Image(systemName: forecastWeatherModelDetail.weatherDataArray.first?.conditionName ?? K.Literals.cloud)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 40)
                Spacer()
                Text(K.Literals.symbol).bold()
            }.foregroundColor(.black)
            .padding()
            .frame(height: 70)
            .background(.white.opacity(0.5)).scaledToFit()
            .cornerRadius(10)
        }
}
                    

struct ForecastCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCellView(forecastWeatherModelDetail: .init(cityName: "Madrid", weatherDataArray: [.init(temperature: 32, minTemperature: 34, maxTemperature: 34, date: "Monday", conditionId: 200)]))
    }
}

