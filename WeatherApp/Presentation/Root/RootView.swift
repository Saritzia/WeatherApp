//
//  RootView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct RootView: View {
    //MARK: -Properties
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
        switch (rootViewModel.appStatus) {
        case .current : CurrentView()
        case .forecast : HomeForecastView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
