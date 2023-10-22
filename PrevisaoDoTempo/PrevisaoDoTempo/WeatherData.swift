//
//  WeatherData.swift
//  PrevisaoDoTempo
//
//  Created by mcor on 14/10/23.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
}
