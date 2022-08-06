//
//  ImportCitiesUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class ImportCitiesUseCase {
  let repository: ImportCityRepositoryProtocol
  let getCitiesImported: GetCitiesImportedUseCase
  let setCitiesImported: SetCitiesImportedUseCase
  let saveCitiesUseCase: SaveCitiesUseCase

  init(repository: ImportCityRepositoryProtocol = ImportCityRepository(),
       getCitiesImported: GetCitiesImportedUseCase = GetCitiesImportedUseCase(),
       setCitiesImported: SetCitiesImportedUseCase = SetCitiesImportedUseCase(),
       saveCitiesUseCase: SaveCitiesUseCase = SaveCitiesUseCase()) {
    self.repository = repository
    self.getCitiesImported = getCitiesImported
    self.setCitiesImported = setCitiesImported
    self.saveCitiesUseCase = saveCitiesUseCase
  }

  func get(with completion: @escaping (Result<Void>) -> Void) {
    if getCitiesImported.get() {
      completion(Result(value: ()))
    } else {
      repository.getCities { [weak self] result in
        guard let self = self, let cities = result.value else {
          completion(Result(error: result.error))
          return
        }
        if result.error == nil {
          self.setCitiesImported.set(true)
        }
        self.saveCitiesUseCase.save(cities: cities, with: completion)
      }
    }
  }
}

