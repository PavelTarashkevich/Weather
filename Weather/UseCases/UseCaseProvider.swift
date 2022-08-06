//
//  UseCaseProvider.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

public class UseCaseProvider {
  private let importCityRepository: ImportCityRepositoryProtocol
  private let weatherRepository: WeatherRepositoryProtocol
  private let settingsRepository: SettingsRepositoryProtocol
  private let cityRepository: CityRepositoryProtocol

  public init() {
    self.importCityRepository = ImportCityRepository()
    self.weatherRepository = WeatherRepository()
    self.settingsRepository = SettingsRepository()
    self.cityRepository = CityRepository()
  }

}


