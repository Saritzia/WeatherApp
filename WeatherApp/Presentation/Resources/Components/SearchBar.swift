//
//  SearchBar.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct SearchBar: View {
    //MARK: -properties
    @State private var citySearched : String = ""
    @FocusState private var textIsFocused : Bool
    @State private var isEditing : Bool = false
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
        HStack{
//MARK: -Location button
            Button(action: {
//                        locationDataManager.requesLocation()
//                        weatherManager.weather =              locationDataManager.weatherManager.weather
            }, label: {
                Image(systemName: K.Views.locationSystemName)
            }).tint(.white)
            .cornerRadius(20)
            .labelStyle(.iconOnly)
            .padding(7.0)
            .foregroundColor(.black)
            .frame(width: 50,height: 50)
            
//MARK: -Search bar
            TextField("Search...", text:  $citySearched)
                .padding(.horizontal,20)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(8)
                .frame(height: 50)
                .focused($textIsFocused)
                .onTapGesture {
                isEditing = true
                }.toolbar(.visible, for: .navigationBar)
                .submitLabel(.search)
                .onSubmit {
                rootViewModel.forecastByDay = []
                rootViewModel.getForecastWeatherDataFromRepository(cityName: citySearched)
                self.citySearched = ""
            }
            if isEditing {
//MARK: -Search button
                Button(action:{
                    self.isEditing = false
                    rootViewModel.forecastByDay = []
                    rootViewModel.getForecastWeatherDataFromRepository(cityName: citySearched)
                    textIsFocused = false
                    self.citySearched = ""
                }){
                    Image(systemName: K.Views.searchSystemName )}.frame(width: 50,height: 50,alignment: .leading).transition(.move(edge: .leading)).foregroundColor(.white)
            }
            
        }.padding(10)   
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
