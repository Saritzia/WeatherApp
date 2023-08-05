//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 3/8/23.
//

import SwiftUI

struct WeatherDetailView: View {
    //MARK: -Properties
    var day : WeatherModel
    
    init(day: WeatherModel) {
        self.day = day
    }
    
    var body: some View {
        VStack{
            HStack{
                //MARK: -Text: city name
                Text(day.cityName)
                    .foregroundColor(Color(.white))
                    .font(.system(size: 30))
                    .bold()
                Spacer()
                //MARK: -Text: temperature
                Text(TemperatureToString.temperatureToString(temperature: day.weatherDataArray.first?.temperature ?? 0.0))
                    .foregroundColor(Color(.white))
                    .font(.system(size: 30))
                    .bold()
                    .padding()
            } .padding(EdgeInsets(
                        top: 50,
                        leading: 20,
                        bottom: 20,
                        trailing: 20))
            //MARK: -Weather image
            Image(systemName: day.weatherDataArray.first?.conditionName ?? K.Literals.cloud)
                .resizable()
                .frame(width: 80,height: 80)
                .foregroundColor(.white)
                .padding(.leading)
            Image("City").resizable()
                .rotationEffect(.degrees(90))
                .frame(width: 300,height: 300)
                .cornerRadius(200)
            
            HStack{
                //MARK: -Text: max temperature
                Text("Max: \(TemperatureToString.temperatureToString(temperature: day.weatherDataArray.first?.maxTemperature ?? 0.0))")
                    .foregroundColor(Color(.white))
                    .font(.system(size: 20))
                    .bold()
                    .padding()
                Spacer()
                //MARK: -Text: min temperature
                Text("Min: \(TemperatureToString.temperatureToString(temperature: day.weatherDataArray.first?.minTemperature ?? 0.0))")
                    .foregroundColor(Color(.white))
                    .font(.system(size: 20))
                    .bold()
                    .padding()
            }
        }.background(Image(K.Views.backgroundImage))
            .ignoresSafeArea()
            .foregroundColor(.white)
            
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(day: .init(cityName: "Madrid", weatherDataArray: [.init(temperature: 32, minTemperature: 34, maxTemperature: 34, date: "Monday", conditionId: 200)]))
    }
}