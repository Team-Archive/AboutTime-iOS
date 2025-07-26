//
//  RecapCardPageIndicator.swift
//  MyProfile
//
//  Created by jinyoung on 7/27/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents

public struct RecapCardPageIndicator: View {
  private let max: Int
  private let currentIndex: Int
  
  public var body: some View {
    HStack(spacing: 4) {
      ForEach(0..<max, id: \.self) { idx in
        Circle()
          .frame(width: idx == currentIndex ? 8 : 6,
                 height: idx == currentIndex ? 8 : 6)
          .foregroundColor(idx == currentIndex ? Gen.Colors.point.color : Gen.Colors.gray600.color)
          .animation(.easeInOut(duration: 0.2), value: currentIndex)
      }
    }
  }
  
  public init(max: Int, currentIndex: Int) {
    self.max = max
    self.currentIndex = currentIndex
  }
}
