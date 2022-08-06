//
//  SettingsRepository.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

protocol SettingsRepositoryProtocol {
  var areCitiesImported: Bool { get set }
}

class SettingsRepository: SettingsRepositoryProtocol {
  private enum Constants {
    static let citiesImportedKey = "citiesImported"
  }

  private let storage: UserDefaults

  init(storage: UserDefaults = UserDefaults.standard) {
    self.storage = storage
  }

  var areCitiesImported: Bool {
    get {
      storage.value(forKey: Constants.citiesImportedKey) as? Bool ?? false
    }
    set {
      storage.set(newValue, forKey: Constants.citiesImportedKey)
    }
  }
}
