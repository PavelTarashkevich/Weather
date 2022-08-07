//
//  CityDetailsCoordinator.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import UIKit

protocol CityDetailsCoordinatorDelegate: AnyObject {
  func coordinatorCompleted(coordinator: CityDetailsCoordinator)
}

class CityDetailsCoordinator: Coordinator {
  typealias Delegate = CityDetailsCoordinatorDelegate
  weak var delegate: Delegate?

  init(navigationController: UINavigationController, delegate: Delegate) {
    self.delegate = delegate

    super.init(navigationController: navigationController)
  }

  func start(with city: CityType) {
    let viewModel = CityWeatherDetailsViewModel(city: city)
      let viewController = CityDetailsViewController.initiate()
    viewController.viewModel = viewModel

    viewModel.bind(self) { [weak self] action in
      guard let self = self else { return }
      switch action {
      case CityWeatherDetailsViewModelAction.backPressed:
        self.delegate?.coordinatorCompleted(coordinator: self)
      default:
        break
      }
    }

    navigationController?.pushViewController(viewController, animated: true)
  }
}
