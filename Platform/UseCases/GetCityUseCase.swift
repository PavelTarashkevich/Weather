//
//  GetCityUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class GetCityUseCase: GetCityUseCase {
  let repository: CityRepositoryProtocol

  init(repository: CityRepositoryProtocol) {
    self.repository = repository
  }

  func get(by id: CityType.Identifier, completion: @escaping (Result<CityType>) -> Void) {
    repository.get(by: id, completion: completion)
  }
}
