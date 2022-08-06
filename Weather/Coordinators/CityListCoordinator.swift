//
//  CityListCoordinator.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import UIKit

class CityListCoordinator: Coordinator {
  override init(navigationController: UINavigationController) {
    super.init(navigationController: navigationController)
  }

  override func start() {
    let viewModel = CityListViewModel()
    let viewController = CityListViewController.initiate()
    viewController.viewModel = viewModel

    viewModel.bind(self) { [weak self] action in
      switch action {
      case CityListViewModelAction.itemSelected(let item):
        self?.toDetails(for: item)
      default:
        break
      }
    }

    navigationController?.pushViewController(viewController, animated: true)
  }
}

extension CityListCoordinator: CityDetailsCoordinatorDelegate {
  func coordinatorCompleted(coordinator: CityDetailsCoordinator) {
    childCompleted(coordinator)
    navigationController?.popViewController(animated: true)
  }
}

private extension CityListCoordinator {
  func toDetails(for city: CityType) {
    guard let navigationController = navigationController else { return }

    let coordinator = CityDetailsCoordinator(navigationController: navigationController, delegate: self)
    childStarted(coordinator)
    coordinator.start(with: city)
  }
}
