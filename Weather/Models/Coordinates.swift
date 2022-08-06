//
//  Coordinates.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

public protocol CoordinatesType {
  var longtitude: Double { get }
  var latitude: Double { get }
}

public struct Coordinates: CoordinatesType {
  public let longtitude: Double
  public let latitude: Double

  public init(longtitude: Double, latitude: Double) {
    self.longtitude = longtitude
    self.latitude = latitude
  }
}
