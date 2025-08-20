//
//  FriendStatusView.swift
//  Home
//
//  Created by jinyoung on 8/12/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import UIComponents
import ArchiveFoundation
import Domain

public struct FriendStatusView: View {

  // MARK: - Public Properties
  private let data: Profile

  // MARK: - Init
  public init(data: Profile) {
    self.data = data
  }
  
  // MARK: - Body
  public var body: some View {
    ZStack {
      ATGradientView(type: data.time.toGradient, direction: .vertical)
        .clipShape(RoundedRectangle(cornerRadius: 24))
      
      HStack(spacing: 0) {
        HStack(spacing: 8) {
          ATUrlImage(
            url: data.imageURL,
            placeholder: Gen.Images.setProfilePlaceholder.image
          )
          .aspectRatio(contentMode: .fill)
          .clipShape(.circle)
          .frame(width: 66, height: 66)
          
          VStack(alignment: .leading, spacing: 4) {
            Text(data.name)
              .font(.fonts(.bodyBold16))
              .foregroundStyle(Gen.Colors.white.color)
              .lineLimit(1)
            
            Text(data.region)
              .font(.fonts(.body13))
              .foregroundStyle(Gen.Colors.white.color)
              .lineLimit(1)
            
            HStack(spacing: 2) {
              data.weather.tag.icon
                .foregroundStyle(Gen.Colors.white.color)
                .font(.fonts(.body12))
                .frame(width: 16, height: 16, alignment: .center)
              
              Text(data.weather.temperatureString)
                .font(.fonts(.body13))
                .foregroundStyle(Gen.Colors.white.color)
            }
          }
        }.layoutPriority(1)
        
        Spacer(minLength: 0)
        
        VStack(alignment: .trailing, spacing: 4) {
          HStack(alignment: .firstTextBaseline, spacing: 4) {
            Text(data.time.hhmm)
              .font(.fonts(.title28))
              .foregroundStyle(Gen.Colors.white.color)
            Text(data.time.meridiem)
              .font(.fonts(.body14))
              .foregroundStyle(Gen.Colors.white.color)
          }
          
          Text(data.time.weekdayMonthDay)
            .font(.fonts(.body13))
            .foregroundStyle(Gen.Colors.white.color)
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 16)
    }
    .frame(height: 98)
  }
}
