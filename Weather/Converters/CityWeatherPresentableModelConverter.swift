//
//  CityWeatherPresentableModelConverter.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

protocol CityWeatherPresentableModelConverterType {
  func from(_ weather: CityWeatherType) -> CityWeatherPresentableModel
}

struct CityWeatherPresentableModelConverter: CityWeatherPresentableModelConverterType {
  func from(_ weather: CityWeatherType) -> CityWeatherPresentableModel {
    let formattedTemperature = String(format: "%.0f", weather.temperatureInCelsius)
    let formattedHumidity = String(format: "%.0f", weather.humidity)
    let formattedPressure = String(format: "%.0f", weather.pressure)
    return CityWeatherPresentableModel(
      temperature: "\(formattedTemperature) C",
      humidity: "\(formattedHumidity) %",
      pressure: "\(formattedPressure) hPa"
    )
  }
}
