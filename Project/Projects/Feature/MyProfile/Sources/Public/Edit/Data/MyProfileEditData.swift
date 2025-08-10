//
//  MyProfileEditData.swift
//  MyProfile
//
//  Created by jinyoung on 8/5/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import ArchiveFoundation

public struct MyProfileEditData {
  let nickname: String
  let city: String
  let timeRange: String
  let profileImageURL: URL?
  
  public init(
    nickname: String,
    city: String,
    timeRange: String,
    profileImageURL: URL?
  ) {
    self.nickname = nickname
    self.city = city
    self.timeRange = timeRange
    self.profileImageURL = profileImageURL
  }
  
  public static func mockData() -> Self {
    MyProfileEditData(
      nickname: "수지",
      city: "🇨🇦 Montreal, Canada",
      timeRange: "오후 9시 ~ 오전 1시",
      profileImageURL: MockImageURL.fetchDatas(
        with: 1
      ).first!
    )
  }
}
