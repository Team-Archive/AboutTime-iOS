//
//  MyProfileEditItemView.swift
//  MyProfile
//
//  Created by jinyoung on 8/5/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

public struct MyProfileEditItemView: View {
  let icon: Image
  let label: String
  let value: String
  let trailing: Image?
  
  public init(
    icon: Image,
    label: String,
    value: String,
    trailing: Image?
  ) {
    self.icon = icon
    self.label = label
    self.value = value
    self.trailing = trailing
  }
  
  public var body: some View {
    HStack(spacing: 12) {
      icon
        .resizable()
        .frame(width: 20, height: 20)
      Text(label)
        .font(.fonts(.body14))
        .foregroundStyle(Gen.Colors.white.color)
      Spacer()
      Text(value)
        .font(.fonts(.body13))
        .foregroundStyle(Gen.Colors.purpleGray50.color)
        .lineLimit(1)
        .truncationMode(.tail)
      if let trailing = trailing {
        trailing
          .resizable()
          .frame(width: 20, height: 20)
      }
    }
    .padding(.horizontal, 16)
    .frame(height: 48)
  }
}
