//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 3/8/23.
//

import SwiftUI

struct WeatherDetailView: View {
    
    var day : WeatherModel
    
    init(day: WeatherModel) {
        self.day = day
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(day: .init(cityName: "Madrid", weatherDataArray: [.init(temperature: 32, minTemperature: 34, maxTemperature: 34, date: Date(), conditionId: 200, description: "cloud")]))
    }
}
