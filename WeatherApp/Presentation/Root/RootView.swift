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
        TabView{
            CurrentView().tabItem {
                Label("Current day", image: "thermometer.sun")
            }
            HomeForecastView().tabItem {
                Label("5 days", image: "calendar.badge.exclamationmark")
            }
        }.foregroundColor(.white)
    }
}

struct RootView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: NameSarchedRemoteDataSource()))
    
    static var previews: some View {
        CurrentView()
            .environmentObject(myEnvObject)
    }
}
