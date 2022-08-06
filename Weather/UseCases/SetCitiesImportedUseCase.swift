//
//  SetCitiesImportedUseCase.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

class SetCitiesImportedUseCase {
  var repository: SettingsRepositoryProtocol

  init(repository: SettingsRepositoryProtocol) {
    self.repository = repository
  }

  func set(_ value: Bool) {
    repository.areCitiesImported = value
  }
}
