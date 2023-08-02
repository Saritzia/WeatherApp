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
            SearchBar()
            Spacer()
            VStack(alignment: .trailing, spacing:20){
                //MARK: -Weather image
                Image(systemName: rootViewModel.forecast?.weatherDataArray.first?.conditionName ?? "cloud").resizable().frame(width: 80,height: 80).foregroundColor(.white).padding(EdgeInsets(top: 40, leading: 50, bottom: 20, trailing: -100)).accessibilityIdentifier("weatherImage")
                //MARK: -Text: temperature
                Text(rootViewModel.forecast?.weatherDataArray.first?.temperatureString ?? "0.0").foregroundColor(Color(.white)).font(.system(size: 40)).bold().padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: -100)).accessibilityIdentifier(K.Views.temperatureLabelAccesibilityName)
                //MARK: -Text: city name
                Text(rootViewModel.forecast?.cityName ?? "City").foregroundColor(Color(.white)).font(.system(size: 30)).bold().padding(EdgeInsets(top: 10, leading: 50, bottom: 20, trailing: -100)).accessibilityIdentifier(K.Views.cityLabelAccesibilityName)
            }
            Spacer()
        }.background(Image(K.Views.backgroundImage).resizable().ignoresSafeArea())
    }
}

struct CurrentView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: NameSarchedRemoteDataSource()))
    
    static var previews: some View {
        CurrentView()
            .environmentObject(myEnvObject)
    }
}
