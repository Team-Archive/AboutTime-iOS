//
//  ATWeatherTagView.swift
//  UIComponents
//
//  Created by Aaron Hanwe LEE on 4/23/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation

public struct ATWeatherTagView: View {
  // MARK: - public state
  
  // MARK: - private properties
  
  private let designType: ATTagView.DesignType
  private let weather: Weather
  
  // MARK: - public properties
  
  // MARK: - life cycle
  
  public var body: some View {
    
    ATTagView(
      designType: self.designType,
      icon: self.weather.tag.icon,
      title: "\(String(format: "%.1f", self.weather.temperature))°C"
    )
    
  }
  
  public init(
    designType: ATTagView.DesignType = .primary,
    weather: Weather
  ) {
    self.designType = designType
    self.weather = weather
  }
  
  // MARK: - private method
  
  // MARK: - internal method
  
}

#Preview {
  VStack {
    ATTagView(icon: Image(systemName: "bolt"), title: "hola")
  }
  
}
