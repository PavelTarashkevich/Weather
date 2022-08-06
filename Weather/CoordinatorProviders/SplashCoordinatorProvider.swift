//
//  SplashCoordinatorProvider.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

protocol SplashCoordinatorProviderType {
  func makeViewModel() -> SplashViewModelType
  func makeViewController(viewModel: SplashViewModelType) -> SplashViewController
}

class SplashCoordinatorProvider: SplashCoordinatorProviderType {
  let useCaseProvider: UseCaseProvider

  init(useCaseProvider: UseCaseProvider) {
    self.useCaseProvider = useCaseProvider
  }

  func makeViewModel() -> SplashViewModelType {
    return SplashViewModel(importCitiesUseCase: useCaseProvider.makeImportCitiesUseCase())
  }

  func makeViewController(viewModel: SplashViewModelType) -> SplashViewController {
    let viewController = SplashViewController.initiate()
    viewController.viewModel = viewModel
    return viewController
  }
}

