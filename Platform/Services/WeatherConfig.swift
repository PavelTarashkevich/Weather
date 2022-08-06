//
//  WeatherConfig.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import Moya
import Alamofire

struct WeatherConfig {
  static let appId = "48e29861fa838dd1b225233f647e28f5"
  static let url = "https://api.openweathermap.org/data/2.5"

  static func defaultProvider<TargetType>() -> MoyaProvider<TargetType> {
    return MoyaProvider()
  }
}
