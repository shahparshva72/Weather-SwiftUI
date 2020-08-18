//
//  ContentView.swift
//  Weather
//
//  Created by Parshva Shah on 8/14/20.
//  Copyright © 2020 Parshva Shah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var cityText: String = ""
    @ObservedObject private var weatherModel = WeatherModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                HStack {
                    TextField("Type your city name...", text: self.$cityText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        self.weatherModel.getWeatherData(city: self.cityText)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 28, height: 28)
                    }
                }
                .padding(.top, 30)
                .padding()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(weatherModel.name)")
                            .font(.title)
                            .padding(.bottom, 10)
                        
                        Image(systemName: "\(weatherModel.conditionName)")
                            .resizable()
                        .frame(width: 88, height: 88)
                            .padding(.bottom, 10)
                        
                        Text("\(weatherModel.conditionDescription.capitalized)")
                            .font(.headline)
                            .padding(.bottom, 10)
                        
                        
                        Text("\(weatherModel.temperature)° C")
                            .font(.title)
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal, 50)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 */
