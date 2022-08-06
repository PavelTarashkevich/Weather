//
//  CityDetailsCoordinatorProvider.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

protocol CityDetailsCoordinatorProviderType {
  func makeViewModel(with city: CityType) -> CityWeatherDetailsViewModel
  func makeViewController(viewModel: CityWeatherDetailsViewModel) -> CityDetailsViewController
}

class CityDetailsCoordinatorProvider: CityDetailsCoordinatorProviderType {
  let useCaseProvider: UseCaseProvider

  init(useCaseProvider: UseCaseProvider) {
    self.useCaseProvider = useCaseProvider
  }

  func makeViewModel(with city: CityType) -> CityWeatherDetailsViewModel {
    return CityWeatherDetailsViewModel(city: city, getCityWeatherUseCase: useCaseProvider.makeGetCityWeatherUseCase())
  }

  func makeViewController(viewModel: CityWeatherDetailsViewModel) -> CityDetailsViewController {
    let viewController = CityDetailsViewController.initiate()
    viewController.viewModel = viewModel
    return viewController
  }
}
