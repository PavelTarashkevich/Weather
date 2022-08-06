//
//  Result.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

public class Result<T> {
  public let value: T?
  public let error: Error?

  public init(value: T? = nil, error: Error? = nil) {
    self.value = value
    self.error = error
  }
}
