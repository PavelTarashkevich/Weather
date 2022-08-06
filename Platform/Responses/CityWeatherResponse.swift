//
//  CityWeatherResponse.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

struct MainWeatherResponse: Codable {
  let temp: Double
  let feels_like: Double
  let temp_min: Double
  let temp_max: Double
  let pressure: Double
  let humidity: Double
}

struct CityWeatherResponse: Codable {
  let coord: CoordinatesResponse
  let main: MainWeatherResponse
}

extension CityWeatherResponse {
  static let sample: [String: Any] = ["coord": [
                                        "lon": 139,
                                        "lat": 35
                                      ],
                                      "main": [
                                        "temp": 281.52,
                                        "feels_like": 278.99,
                                        "temp_min": 280.15,
                                        "temp_max": 283.71,
                                        "pressure": 1016,
                                        "humidity": 93
                                      ]]
}
