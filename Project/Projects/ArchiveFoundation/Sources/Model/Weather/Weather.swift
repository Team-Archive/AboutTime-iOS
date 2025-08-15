//
//  Weather.swift
//  ArchiveFoundation
//
//  Created by jinyoung on 8/7/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import Foundation

public struct Weather: Equatable, Sendable {
  public let tag: WeatherTag
  public let temperature: Float
  
  public var temperatureString: String {
    "\(String(format: "%.0f", temperature))°C"
  }
  
  public init(tag: WeatherTag, temperature: Float) {
    self.tag = tag
    self.temperature = temperature
  }
}
