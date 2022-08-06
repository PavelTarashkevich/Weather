//
//  CityListCoordinatorProvider.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import UIKit

protocol CityListCoordinatorProviderType {
  func makeViewModel() -> CityListViewModelType
  func makeViewController(viewModel: CityListViewModelType) -> CityListViewController
  func makeCityDetailsCoordinator(navigationController: UINavigationController,
                                  delegate: CityDetailsCoordinatorDelegate) -> CityDetailsCoordinator
}

class CityListCoordinatorProvider: CityListCoordinatorProviderType {
  let useCaseProvider: UseCaseProvider

  init(useCaseProvider: UseCaseProvider) {
    self.useCaseProvider = useCaseProvider
  }

  func makeViewModel() -> CityListViewModelType {
    return CityListViewModel(getCitiesUseCase: useCaseProvider.makeGetCitiesUseCase(),
                             getCityUseCase: useCaseProvider.makeGetCityUseCase())
  }

  func makeViewController(viewModel: CityListViewModelType) -> CityListViewController {
    let viewController = CityListViewController.initiate()
    viewController.viewModel = viewModel
    return viewController
  }

  func makeCityDetailsCoordinator(navigationController: UINavigationController,
                                  delegate: CityDetailsCoordinatorDelegate) -> CityDetailsCoordinator {
    let coordinatorProvider = makeCityDetailsCoordinatorProvider()
    return CityDetailsCoordinator(navigationController: navigationController,
                                  delegate: delegate,
                                  coordinatorProvider: coordinatorProvider)
  }
}

private extension CityListCoordinatorProvider {
  func makeCityDetailsCoordinatorProvider() -> CityDetailsCoordinatorProviderType {
    CityDetailsCoordinatorProvider(useCaseProvider: useCaseProvider)
  }
}
