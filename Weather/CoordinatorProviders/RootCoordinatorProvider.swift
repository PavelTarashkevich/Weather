//
//  RootCoordinatorProvider.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import UIKit

protocol RootCoordinatorProviderType {
  func makeSplashCoordinator(window: UIWindow, delegate: SplashCoordinatorDelegate) -> SplashCoordinator
  func makeCityListCoordinator(navigationController: UINavigationController) -> CityListCoordinator
}

class RootCoordinatorProvider: RootCoordinatorProviderType {
  let useCaseProvider: UseCaseProvider

  init(useCaseProvider: UseCaseProvider) {
    self.useCaseProvider = useCaseProvider
  }

  func makeSplashCoordinator(window: UIWindow, delegate: SplashCoordinatorDelegate) -> SplashCoordinator {
    let coordinatorProvider = makeSplashCoordinatorProvider()
    return SplashCoordinator(window: window,
                             delegate: delegate,
                             coordinatorProvider: coordinatorProvider)
  }

  func makeCityListCoordinator(navigationController: UINavigationController) -> CityListCoordinator {
    let coordinatorProvider = makeCityListCoordinatorProvider()
    return CityListCoordinator(navigationController: navigationController,
                               coordinatorProvider: coordinatorProvider)
  }
}

private extension RootCoordinatorProvider {
  func makeSplashCoordinatorProvider() -> SplashCoordinatorProviderType {
    SplashCoordinatorProvider(useCaseProvider: useCaseProvider)
  }

  func makeCityListCoordinatorProvider() -> CityListCoordinatorProviderType {
    CityListCoordinatorProvider(useCaseProvider: useCaseProvider)
  }
}
