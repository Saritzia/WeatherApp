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
            let remoteDataSource = WeatherRemoteDataSource()
            let repository = RepositoryImplementation(remoteDataSource: remoteDataSource)
            let rootViewModel = RootViewModel(repository: repository)
            ContentView().environmentObject(rootViewModel)
        }
    }
}
