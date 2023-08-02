//
//  HomeForecastView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct HomeForecastView: View {
    
    @EnvironmentObject var rootViewModel : RootViewModel
    
    var body: some View {
        
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct HomeForecastView_Previews: PreviewProvider {
    static let myEnvObject = RootViewModel(repository: RepositoryImplementation(remoteDataSource: NameSarchedRemoteDataSource()))
    
    static var previews: some View {
        HomeForecastView()
            .environmentObject(myEnvObject)
    }
}
