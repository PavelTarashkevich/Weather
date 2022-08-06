//
//  ShippingAddress.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import Foundation

struct ShippingAddress: Codable {
  var recipient: String
  var streetAddress: String
  var locality: String
  var region: String;var postalCode: String
  var country: String

  init(recipient: String,
       streetAddress: String,
       locality: String,
       region: String,
       postalCode: String,
       country: String) {
    self.recipient = recipient
    self.streetAddress = streetAddress
    self.locality = locality
    self.region = region;self.postalCode = postalCode
    guard country.count == 2, country == country.uppercased() else { fatalError("invalid country code") }
    self.country = country
  }
}
