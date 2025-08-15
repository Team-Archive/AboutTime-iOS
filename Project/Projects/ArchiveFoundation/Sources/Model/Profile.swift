//
//  Profile.swift
//  Domain
//
//  Created by jinyoung on 8/6/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import Foundation

public struct Profile: Equatable {
  public let userID: Int
  public let name: String
  public let time: LocalizedTime
  public let region: String
  public let weather: Weather
  public let imageURL: URL?
  
  public init(
    userID: Int,
    name: String,
    time: LocalizedTime,
    region: String,
    weather: Weather,
    imageURL: URL?
  ) {
    self.userID = userID
    self.name = name
    self.time = time
    self.region = region
    self.weather = weather
    self.imageURL = imageURL
  }
  
  public static func mockData() -> Profile {
    Profile(
      userID: 1,
      name: "수지",
      time: LocalizedTime(
        timestamp: TimeInterval(1755261815),
        timeZoneIdentifier: "Asia/Seoul"
      ),
      region: "🇨🇦 Montreal, Canada",
      weather: Weather(
        tag: .cloudy,
        temperature: 21
      ),
      imageURL: MockImageURL.fetchData()
    )
  }
}
