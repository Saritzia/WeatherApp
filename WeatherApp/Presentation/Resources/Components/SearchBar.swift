//
//  SearchBar.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct SearchBar: View {
    //MARK: -properties
    @State private var citySearched : String = ""
    @FocusState private var textIsFocused : Bool
    @State private var isEditing : Bool = false
    @EnvironmentObject var rootViewModel : RootViewModel
    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {
        HStack{
            //MARK: -LocationButton
            LocationButton{
                //Must clear the array before each search
                rootViewModel.forecastByDay = []
                //Request current location
                locationDataManager.requestLocation()
                if let location = locationDataManager.location{
                    rootViewModel.getDataWeatherFromLocation(latitude: location.latitude, longitude: location.longitude, testCompletion: nil)
                }
            }.tint(.white)
                .cornerRadius(20)
                .labelStyle(.iconOnly)
                .padding(7.0)
                .foregroundColor(.black)
                .frame(width: 50,height: 50)
            
            //MARK: -Search bar
            TextField(K.Literals.textInTextField, text:  $citySearched)
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
                    //Clear the array before each search
                    rootViewModel.forecastByDay = []
                    //Searching by city name
                    rootViewModel.getForecastWeatherDataFromRepository(cityName: citySearched, testCompletion: nil)
                    self.citySearched = ""
                }
            if isEditing {
                //MARK: -Search button
                Button(action:{
                    self.isEditing = false
                    //Clear the array before each search
                    rootViewModel.forecastByDay = []
                    //Searching by city name
                    rootViewModel.getForecastWeatherDataFromRepository(cityName: citySearched, testCompletion: nil)
                    textIsFocused = false
                    self.citySearched = ""
                }){
                    Image(systemName: K.Views.searchSystemName )}
                .frame(width: 50,height: 50,alignment: .leading)
                .transition(.move(edge: .leading))
                .foregroundColor(.white)
            }
            
        }.padding(10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
