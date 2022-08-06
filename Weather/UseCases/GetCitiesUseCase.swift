//
//  GetCitiesUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class GetCitiesUseCase {
  let repository: CityRepositoryProtocol

  init(repository: CityRepositoryProtocol) {
    self.repository = repository
  }

  func get(with completion: @escaping (Result<[CityType]>) -> Void) {
    repository.getCities(with: completion)
  }

  func get(by text: String, completion: @escaping (Result<[CityType]>) -> Void) {
    repository.getCities(by: text, completion: completion)
  }
}
