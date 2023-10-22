//
//  WeatherViewModel.swift
//  PrevisaoDoTempo
//
//  Created by mcor on 14/10/23.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    private var cancellable: AnyCancellable?

    func fetchWeather(forCity city: String) {
        let apiKey = "90ffcc03afdf7bec27e0943dc9521f4b&units=metric"
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"

        cancellable = AF.request(url)
            .publishDecodable(type: WeatherData.self)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] response in
                    self?.weatherData = response.value
                  })
    }
}

