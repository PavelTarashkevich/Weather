//
//  CityCell.swift
//  Weather
//
//  Created by User on 05.08.2022.
//

import UIKit

class CityCell: UITableViewCell, Cell {
  @IBOutlet var title: UILabel!

  func update(with model: CityPresentableModel) {
    title.text = model.name
  }
}

