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
    
    //MARK: -View
    var body: some View {
        //Creating a tab view to navigate between these views using the same information searched
        TabView{
            Group{
                CurrentView().tabItem {
                    Label(K.Literals.ahora, systemImage: K.Views.currentImage)
                }
                
                HomeForecastView().tabItem {
                    Label(K.Literals.fiveDays, systemImage: K.Views.fiveDaysImage)
                }
            }
            
        } .accentColor(Color.red)
            .onAppear() {
                UITabBar.appearance().backgroundColor = .white
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: WeatherRemoteDataSource()))
    
    static var previews: some View {
        RootView()
            .environmentObject(myEnvObject)
    }
}
