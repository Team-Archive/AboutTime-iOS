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
  
  @State var isToggleOn: Bool = false
  
  private let mockProfiles = Profile.mockDatas(currentTime: Date().timeIntervalSince1970)
  
  public init() {
    
  }
  
  public var body: some View {
    ZStack {
      ATBackgroundView()
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 12) {
        HStack(spacing: 8) {
          ATSegmentedDynamicControlView(
            segmentTitleList: [
              "피드",
              "시간"
            ]
          )
          
          Spacer()
          
          
          Gen.Images.noti.image
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
            
            VStack(spacing: 8) {
              ForEach(mockProfiles, id: \.userID) { profile in
                FriendStatusView(data: profile)
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
