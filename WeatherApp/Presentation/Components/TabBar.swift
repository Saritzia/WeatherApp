//
//  TabBar.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 2/8/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView{
            ContentView().tabItem {
                Label("Current day", image: "thermometer.sun")
            }
            ContentView().tabItem {
                Label("5 days", image: "calendar.badge.exclamationmark")
            }
        }.background(.gray).foregroundColor(.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
