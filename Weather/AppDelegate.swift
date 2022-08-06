//
//  AppDelegate.swift
//  Weather
//
//  Created by User on 28.07.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator: RootCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let initialWindow = UIWindow()
      let useCaseProvider = UseCaseProvider()
    let rootCoordinator = RootCoordinator(window: initialWindow,
                                          useCaseProvider: useCaseProvider,
                                          coordinatorProvider: RootCoordinatorProvider(useCaseProvider: useCaseProvider))
    rootCoordinator.start()
    initialWindow.makeKeyAndVisible()
    window = initialWindow
    coordinator = rootCoordinator

    return true
  }
}
