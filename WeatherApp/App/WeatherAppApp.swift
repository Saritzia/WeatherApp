//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = NameSarchedRemoteDataSource()
            let repository = RepositoryImplementation(remoteDataSource: remoteDataSource)
            RootView().environmentObject(RootViewModel(repository: repository))
        }
    }
}
