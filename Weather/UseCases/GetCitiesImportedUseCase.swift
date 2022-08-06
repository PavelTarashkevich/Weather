//
//  GetCitiesImportedUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class GetCitiesImportedUseCase {
  let repository: SettingsRepositoryProtocol

  init(repository: SettingsRepositoryProtocol = SettingsRepository()) {
    self.repository = repository
  }

  func get() -> Bool {
    repository.areCitiesImported
  }
}
