//
//  SplashCoordinator.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
  func splashCoordinatorCompleted(coordinator: SplashCoordinator)
}

class SplashCoordinator: Coordinator {
  typealias Delegate = SplashCoordinatorDelegate
  weak var delegate: Delegate?

  init(window: UIWindow, delegate: Delegate) {
    self.delegate = delegate

    super.init(window: window)
  }

  override func start() {
    let viewModel = SplashViewModel()
    let viewController = SplashViewController.initiate()
    viewController.viewModel = viewModel

    viewModel.bind(self) { action in
      switch action {
      case SplashViewModelAction.completed, SplashViewModelAction.showError:
        self.delegate?.splashCoordinatorCompleted(coordinator: self)
      case SplashViewModelAction.isLoading:
        break
      default:
        break
      }
    }

    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
}
