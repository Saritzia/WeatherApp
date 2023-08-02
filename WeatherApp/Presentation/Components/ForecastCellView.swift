//
//  ForecastCellView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct ForecastCellView: View {
    var body: some View {
        HStack(alignment: .center,spacing: 30){
            Text("Día")
            Text("37ºC")
            Image(systemName: K.ModelConditionName.cloud)
        }
    }
}

struct ForecastCellView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCellView()
    }
}
