//
//  HomeForecastView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct HomeForecastView: View {
    //MARK: -Properties
    @EnvironmentObject var rootViewModel : RootViewModel
    
    //MARK: -View
    var body: some View {
        NavigationStack {
            ZStack (alignment: .top) {
    //MARK: -Background image
                Image(K.Views.backgroundImage)
                    .resizable()
                    .ignoresSafeArea()
                VStack{
    //MARK: -Search bar
                    SearchBar().padding(EdgeInsets(
                                            top: 5,
                                            leading: 10,
                                            bottom: 5,
                                            trailing: 40))
    //MARK: -Link cells
                    VStack{
                        ForEach(rootViewModel.forecastByDay) { day in
                            NavigationLink {
                                WeatherDetailView(day: day)
                            } label: {
                                ForecastCellView(forecastWeatherModelDetail: day)
                            }
                        }.scrollContentBackground(.hidden)
                         .navigationTitle(rootViewModel.forecast?.cityName ?? K.Literals.city)
                         .navigationBarTitleDisplayMode(.inline)
                    }.padding(EdgeInsets(
                                top: 30,
                                leading: 5,
                                bottom: 5,
                                trailing: 5))
               }
            }
        }
    }
}

struct HomeForecastView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: WeatherRemoteDataSource()))
    
    static var previews: some View {
        HomeForecastView().environmentObject(myEnvObject)
    }
}
