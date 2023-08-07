//
//  CurrenView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct CurrentView: View {
    //MARK: -Properties
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
            VStack{
                //MARK: -Search bar
                SearchBar().padding(EdgeInsets(
                    top: 5,
                    leading: 10,
                    bottom: 5,
                    trailing: 40))
                
                VStack(alignment: .trailing, spacing:20){
                    //MARK: -Weather image
                    Image(systemName: rootViewModel.forecast?.weatherDataArray.first?.conditionName ?? K.Literals.cloud)
                        .resizable()
                        .frame(width: 80,height: 80)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(
                            top: 40,
                            leading: 50,
                            bottom: 20,
                            trailing: -100))
                    //MARK: -Text: temperature
                    Text(TemperatureFormatter.temperatureToString(temperature: rootViewModel.forecast?.weatherDataArray.first?.temperature ?? 0.0))
                        .foregroundColor(Color(.white))
                        .font(.system(size: 40))
                        .bold()
                        .padding(EdgeInsets(
                            top: 10,
                            leading: 50,
                            bottom: 20,
                            trailing: -100))
                    //MARK: -Text: city name
                    Text(rootViewModel.forecast?.cityName ?? K.Literals.city)
                        .foregroundColor(Color(.white))
                        .font(.system(size: 30))
                        .bold()
                        .padding(EdgeInsets(
                            top: 10,
                            leading: 50,
                            bottom: 20,
                            trailing: -100))
                }
                Spacer()
            } .background(Image(K.Views.backgroundImage)
                .resizable()
                .ignoresSafeArea()
                .foregroundColor(.white))
    }
}

struct CurrentView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: WeatherRemoteDataSource()))
    
    static var previews: some View {
        CurrentView()
            .environmentObject(myEnvObject)
    }
}
