//
//  CityResponse.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

struct CityResponse: Decodable {
  let id: City.Identifier
  let name: String
  let country: String
  let coord: CoordinatesResponse
}
