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

public struct FriendStatusData: Sendable {
  public let name: String
  public let location: String
  public let weather: Weather
  public let timeText: String
  public let meridiemText: String
  public let dateText: String

  public init(
    name: String,
    location: String,
    weather: Weather,
    timeText: String,
    meridiemText: String,
    dateText: String
  ) {
    self.name = name
    self.location = location
    self.weather = weather
    self.timeText = timeText
    self.meridiemText = meridiemText
    self.dateText = dateText
  }
  
  public static func mockData() -> Self {
    FriendStatusData(
      name: "Josepjus Adolphus",
      location: "🇫🇷 Paris, France",
      weather: Weather(tag: .cloudy, temperature: 17.6),
      timeText: "7:14",
      meridiemText: "PM",
      dateText: "4월 30일 토요일"
    )
  }
}

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
      // Background gradient per Figma node (#3519D1 -> #CE4E3A), rounded 24, shadow
      RoundedRectangle(cornerRadius: 24, style: .continuous)
        .fill(
          LinearGradient(
            gradient: Gradient(colors: [
              Gen.Colors.gradationMorningStart.color,
              Gen.Colors.gradationMorningEnd.color
            ]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 9)
      
      HStack(spacing: 0) {
        HStack(spacing: 8) {
          ZStack {
            Circle()
              .fill(Gen.Colors.white.color.opacity(0.2))
            Image(systemName: "person.fill")
              .foregroundStyle(Gen.Colors.white.color)
              .font(.system(size: 28, weight: .semibold))
          }
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
                .font(.system(size: 12, weight: .semibold))
                .frame(width: 16, height: 16, alignment: .center)
              
              Text("\(data.weather.temperature)°")
                .font(.fonts(.body13))
                .foregroundStyle(Gen.Colors.white.color)
            }
          }
        }
        
        Spacer(minLength: 0)
        
        VStack(alignment: .trailing, spacing: 4) {
          HStack(alignment: .firstTextBaseline, spacing: 4) {
            Text(data.time)
              .font(.fonts(.title28))
              .foregroundStyle(Gen.Colors.white.color)
            Text("PM")
              .font(.fonts(.body14))
              .foregroundStyle(Gen.Colors.white.color)
          }
          
          Text("Saturday, Mar 30")
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
