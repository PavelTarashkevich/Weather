//
//  SaveCitiesUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class SaveCitiesUseCase: SaveCitiesUseCase {
  let repository: CityRepositoryProtocol

  init(repository: CityRepositoryProtocol) {
    self.repository = repository
  }

  func save(cities: [CityType], with completion: @escaping (Result<Void>) -> Void) {
    repository.setCities(cities, with: completion)
  }
}
