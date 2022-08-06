//
//  GetCityWeatherUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class GetCityWeatherUseCase {
  let repository: WeatherRepositoryProtocol

  init(repository: WeatherRepositoryProtocol) {
    self.repository = repository
  }

  func get(with cityId: City.Identifier, completion: @escaping (Result<CityWeatherType>) -> Void) {
    repository.get(with: cityId, completion: completion)
  }
}
