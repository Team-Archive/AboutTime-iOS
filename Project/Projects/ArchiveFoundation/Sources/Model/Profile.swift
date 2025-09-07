//
//  Profile.swift
//  Domain
//
//  Created by jinyoung on 8/6/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import Foundation

public struct Profile: Equatable, Sendable {
  public let userID: Int
  public let name: String
  public let time: LocalizedTime
  public let region: String
  public let weather: Weather
  public let imageURL: URL?
  public let inActive: Bool
  
  public init(
    userID: Int,
    name: String,
    time: LocalizedTime,
    region: String,
    weather: Weather,
    imageURL: URL?,
    inActive: Bool
  ) {
    self.userID = userID
    self.name = name
    self.time = time
    self.region = region
    self.weather = weather
    self.imageURL = imageURL
    self.inActive = inActive
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
      imageURL: MockImageURL.fetchData(),
      inActive: true
    )
  }
  
  public static func mockDatas(currentTime: TimeInterval) -> [Profile] {
    return [
      Profile(
        userID: 1,
        name: "수지",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "America/Toronto"
        ),
        region: "🇨🇦 Montreal, Canada",
        weather: Weather(
          tag: .cloudy,
          temperature: 21
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: false
      ),
      Profile(
        userID: 2,
        name: "지민",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "Europe/Moscow"
        ),
        region: "🇷🇺 Moscow, Russia",
        weather: Weather(
          tag: .cloudy,
          temperature: 29
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: true
      ),
      Profile(
        userID: 3,
        name: "민호",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "Europe/London"
        ),
        region: "🇬🇧 London, UK",
        weather: Weather(
          tag: .cloudy,
          temperature: 16
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: false
      ),
      Profile(
        userID: 4,
        name: "유리",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "Asia/Tokyo"
        ),
        region: "🇯🇵 Tokyo, Japan",
        weather: Weather(
          tag: .cloudy,
          temperature: -2
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: false
      ),
      Profile(
        userID: 9,
        name: "John",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "America/New_York"
        ),
        region: "🇺🇸 New York, USA",
        weather: Weather(
          tag: .cloudy,
          temperature: 22
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: false
      ),
      Profile(
        userID: 10,
        name: "Emma",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "Australia/Sydney"
        ),
        region: "🇦🇺 Sydney, Australia",
        weather: Weather(
          tag: .cloudy,
          temperature: 18
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: true
      ),
      Profile(
        userID: 11,
        name: "Carlos",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "America/Mexico_City"
        ),
        region: "🇲🇽 Mexico City, Mexico",
        weather: Weather(
          tag: .cloudy,
          temperature: 27
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: false
      ),
      Profile(
        userID: 12,
        name: "Sophie",
        time: LocalizedTime(
          timestamp: currentTime,
          timeZoneIdentifier: "Europe/Paris"
        ),
        region: "🇫🇷 Paris, France",
        weather: Weather(
          tag: .cloudy,
          temperature: 14
        ),
        imageURL: MockImageURL.fetchData(),
        inActive: true
      )
    ]
  }
}
