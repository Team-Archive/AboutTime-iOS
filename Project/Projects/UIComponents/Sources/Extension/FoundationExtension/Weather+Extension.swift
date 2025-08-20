//
//  Weather+Extension.swift
//  UIComponents
//
//  Created by jinyoung on 8/15/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation

extension WeatherTag {
  public var icon: Image {
    switch self {
    case .cloudy:
      return Gen.Images.fewClouds.image
    }
  }
}
