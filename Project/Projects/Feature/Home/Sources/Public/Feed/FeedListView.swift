//
//  FeedListView.swift
//  Home
//
//  Created by jinyoung on 8/21/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

public struct FeedListData: Sendable {
  public let feedItems: [FeedItemData]
  
  public var isInActiveFriendsCount: Int {
    feedItems.count { $0.inActive }
  }
}

public struct FeedItemData: Sendable {
  public let profile: Profile
  public let currentTime: TimeInterval
  public let feedTime: TimeInterval
  public let statusText: String
  public let feedImages: [URL]
  public let inActive: Bool
  
  public init(
    profile: Profile,
    currentTime: TimeInterval,
    feedTime: TimeInterval,
    statusText: String,
    feedImages: [URL],
    inActive: Bool
  ) {
    self.profile = profile
    self.currentTime = currentTime
    self.feedTime = feedTime
    self.statusText = statusText
    self.feedImages = feedImages
    self.inActive = inActive
  }
}

struct FeedListView: View {
  
  @Binding private var data: FeedListData
  
  @Binding private var isShowOnlyActiveFriends: Bool
  
  init(
    data: Binding<FeedListData>,
    isShowOnlyActiveFriends: Binding<Bool>
  ) {
    _data = data
    _isShowOnlyActiveFriends = isShowOnlyActiveFriends
  }
  
  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        // '서로 깨어있는 친구' 라벨
        HStack(spacing: 4) {
          Text("서로 깨어있는 친구")
            .font(.fonts(.body14))
            .foregroundColor(Gen.Colors.white.color)
          Text("\(data.isInActiveFriendsCount)")
            .font(.fonts(.bodyBold14))
            .foregroundColor(Gen.Colors.point.color)
          
          Spacer()
        }
        .padding(.bottom, 12)
        
        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            ForEach(isShowOnlyActiveFriends ? data.feedItems.filter { $0.inActive } : data.feedItems, id: \.feedImages) { item in
              FeedItemView(
                name: item.profile.name,
                city: item.profile.region,
                time: item.profile.time,
                currentTime: item.currentTime,
                feedTime: item.feedTime,
                weather: item.profile.weather,
                statusText: item.statusText,
                profileImage: item.profile.imageURL,
                feedImages: item.feedImages
              )
            }
            Spacer(minLength: 24)
          }
        }
        Spacer()
      }
    }
  }
}
