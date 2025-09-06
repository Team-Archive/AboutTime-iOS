//
//  HomeEntryView.swift
//  Home
//
//  Created by jinyoung on 8/19/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

public struct HomeEntryView: View {
  
  private enum HomeSegmentControlType: Int {
    case feed
    case time
    
    var title: String {
      switch self {
      case .feed:
        return "피드"
      case .time:
        return "시간"
      }
    }
  }
  
  @State private var selectedSegment: HomeSegmentControlType = .feed
  
  @State var isToggleOn: Bool = false
  
  private let mockProfiles = Profile.mockDatas(currentTime: Date().timeIntervalSince1970)
  
  private var feedItemDatas: FeedListData = FeedListData(feedItems: [
      FeedItemData(
        profile: Profile.mockDatas(currentTime: currentTime).randomElement()!,
        currentTime: Date().timeIntervalSince1970,
        feedTime: Date().timeIntervalSince1970 - 3600,
        statusText: "In the elevator",
        feedImages: MockImageURL.fetchDatas(with: 5),
        inActive: true
      ),
      FeedItemData(
        profile: Profile.mockDatas(currentTime: currentTime).randomElement()!,
        currentTime: Date().timeIntervalSince1970,
        feedTime: Date().timeIntervalSince1970 - 60 * 10,
        statusText: "Sunset",
        feedImages: MockImageURL.fetchDatas(with: 5),
        inActive: false
      )
    ]
  )
  
  private static let currentTime = Date().timeIntervalSince1970
  
  public init() {
    
  }
  
  public var body: some View {
    ZStack {
      ATBackgroundView()
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 12) {
        HStack(spacing: 8) {
          ATSegmentedDynamicControlView(
            segmentTitleList: [HomeSegmentControlType.feed.title, HomeSegmentControlType.time.title],
            selectedSegmentIndex: Binding(
              get: { selectedSegment.rawValue },
              set: { selectedSegment = HomeSegmentControlType(rawValue: $0) ?? .feed }
            )
          )
          
          Spacer()
          
          
          Gen.Images.alert24.image
            .frame(width: 24, height: 24)
            
          
          Gen.Images.allPerson.image
            .frame(width: 24, height: 24)
          

        }
        ScrollView {
          VStack(spacing: 16) {
            
            HStack(spacing: 8) {
              Spacer()
              
              Toggle(isOn: $isToggleOn) {
                Text("활동중인 친구")
                  .font(.fonts(.body14))
                  .foregroundStyle(Gen.Colors.white.color)
              }
              .toggleStyle(
                ATToggleStyle(
                  onColor: Gen.Colors.purple.color,
                  offColor: Gen.Colors.gray200.color,
                  onThumbColor: Gen.Colors.white.color,
                  offThumbColor: Gen.Colors.white.color
                )
              )
            }
            
            switch selectedSegment {
            case .feed:
              FeedListView(
                data: .constant(feedItemDatas),
                isShowOnlyActiveFriends: $isToggleOn
              )
            case .time:
              VStack(spacing: 8) {
                ForEach(mockProfiles, id: \.userID) { profile in
                  FriendStatusView(data: profile)
                }
              }
            }
            
            Spacer()
          }
        }
        .scrollIndicators(.hidden)
      }
      .padding(.horizontal, 20)
      

      VStack {
        Spacer()

        ATRoundIconButton(
          icon: Gen.Images.send24.image,
          backgroundColor: Gen.Colors.point.color,
          borderColor: .white,
          borderWidth: 2,
          iconSizeType: .constant(CGSize(width: 24, height: 24)),
          action: {

          }
        )
        .frame(width: 62, height: 62)
        .padding(.bottom, 0)
      }
    }
  }
    
}
