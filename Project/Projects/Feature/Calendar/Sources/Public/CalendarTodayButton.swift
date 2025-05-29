//
//  CalendarTodayButton.swift
//  Calendar
//
//  Created by jinyoung on 5/29/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import UIComponents

public struct CalendarTodayButton: View {
  public var action: () -> Void

  public init(action: @escaping () -> Void) {
    self.action = action
  }

  public var body: some View {
    Button(action: action) {
      VStack(spacing: 4) {
        Text("오늘")
          .font(.fonts(.buttonSemiBold14))
          .foregroundStyle(Gen.Colors.point.color)

        // 밑줄
        Rectangle()
          .frame(width: 25, height: 1)
          .foregroundColor(Gen.Colors.point.color)
      }
      .foregroundColor(Gen.Colors.point.color)
    }
  }
}
