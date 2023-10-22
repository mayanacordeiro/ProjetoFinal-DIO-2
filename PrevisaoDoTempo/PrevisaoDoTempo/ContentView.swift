//
//  ContentView.swift
//  PrevisaoDoTempo
//
//  Created by mcor on 14/10/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    @State private var city = ""
    @State private var showResult = false
    
    var body: some View {
        VStack {
            Text("Forecast")
                .font(.largeTitle)
                .foregroundColor(.orange)
            
            Spacer()
            TextField("Enter city name", text: $city)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.words)
            
            HStack {
                Button("Get Weather") {
                    viewModel.fetchWeather(forCity: city)
                    city = ""
                    showResult = true
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.orange)
            }
            
            Button("Clear") {
                showResult = false
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.gray)
            .disabled(!showResult)
            .frame(width: 200)
            
            Spacer()
            
            
            if let weatherData = viewModel.weatherData, showResult {
                Text("City: \(weatherData.name)")
                Text("Temperature: \(String(format: "%.0f", weatherData.main.temp))°C")
                Text("Description: \(weatherData.weather.first?.description ?? "N/A")")
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray5))
    }
}


#Preview {
    ContentView()
}
