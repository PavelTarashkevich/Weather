//
//  TargetTypeExtension.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation
import Moya

extension TargetType {
  func sampleData(from sample: Any, file: String = #file, line: Int = #line) -> Data {
    guard let data = try? JSONSerialization.data(withJSONObject: sample) else {
      fatalError("Unable to convert sample data in \(file) at line \(line)")
    }

    return data
  }
}
