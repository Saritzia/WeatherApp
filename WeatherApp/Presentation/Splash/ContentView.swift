//
//  ContentView.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 31/7/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: -Properties
    let letters = Array(K.title)
    @State private var rotation: Double = 0
    @State private var isSliding: Bool = false
    let slideGently = Animation.easeOut(duration: 1).delay(2).repeatForever(autoreverses: false).delay(-0.67)
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .center){
                HStack(spacing: 0) {
                    ForEach(0..<letters.count, id: \.self) { slide in
                        Text(String(letters[slide]))
                            .font(.system(size: 100))
                            .bold()
                            .foregroundColor(.white)
                            .scaleEffect(isSliding ? 0.25 : 1)
                            .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: -1, z: 0))
                            .opacity(isSliding ? 0 : 1)
                            .hueRotation(.degrees(isSliding ? 320 : 0))
                            .animation(.easeOut(duration: 1).delay(2).repeatForever(autoreverses: false).delay(Double(-slide) / 20), value: isSliding)
                    }
                    Image(systemName: K.Literals.chevron)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .scaleEffect(isSliding ? 0.25 : 1)
                        .opacity(isSliding ? 0 : 1)
                        .offset(x: isSliding ? -50 : 1)
                        .animation(slideGently, value: isSliding)
                }
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .background(Image(K.Views.backgroundImage))
                .cornerRadius(32)
                
                NavigationLink {
                    RootView()
                } label: {
                    Text(K.Literals.start)
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .foregroundColor(.white)
                        .background(Color.brown)
                        .cornerRadius(30)
                }
            }
            .onAppear {
                isSliding = true
                rotation = 360
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
