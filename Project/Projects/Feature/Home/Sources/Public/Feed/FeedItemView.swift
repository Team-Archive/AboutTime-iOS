//
//  FeedItemView.swift
//  Home
//
//  Created by jinyoung on 9/7/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

struct FeedItemView: View {
  let name: String
  let city: String
  let time: LocalizedTime
  let currentTime: TimeInterval
  let feedTime: TimeInterval
  let weather: Weather
  let statusText: String
  let profileImage: URL?
  let feedImages: [URL]
  
  @State private var currentPage: Int = 0
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        if let profileURL = profileImage {
          ATUrlImage(url: profileURL)
            .aspectRatio(contentMode: .fill)
            .clipShape(.circle)
            .frame(width: 44, height: 44)
        } else {
          // TODO: placeholder 확인 필요
        }
        
        VStack(alignment: .leading, spacing: 2) {
          Text(name)
            .font(.fonts(.bodyBold14))
            .foregroundColor(Gen.Colors.white.color)
          HStack(spacing: 4) {
            Text(city)
              .font(.fonts(.body13))
              .foregroundColor(Gen.Colors.gray300.color)
            Text("\(time.hhmm)\(time.meridiem)")
              .font(.fonts(.body13))
              .foregroundColor(Gen.Colors.white.color)
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background(
                RoundedRectangle(cornerRadius: 4)
                  .fill(Gen.Colors.purpleGray300.color)
              )
            Spacer()
          }
        }
        Spacer()

        Button(action: {
          
        }) {
          Circle()
            .fill(Gen.Colors.purpleGray200.color)
            .frame(width: 44, height: 44)
            .overlay(
              Gen.Images.send24.image
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Gen.Colors.white.color)
            )
        }
      }
      
      VStack(spacing: 0) {
        ZStack(alignment: .bottom) {
          FeedPagerView(images: feedImages, currentIndex: $currentPage)
          
          Text(statusText)
            .font(.fonts(.bodyBold14))
            .foregroundColor(Gen.Colors.white.color)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(Gen.Colors.purpleGray500.color)
            )
            .padding(.bottom, 20)
        }
        
        ZStack {
          HStack(spacing: 4) {
            let elaspedTime = ElapsedTimeFormatter.format(current: currentTime, target: feedTime)
            Text("\(elaspedTime)")
              .font(.fonts(.body14))
              .foregroundStyle(Gen.Colors.gray300.color)
            
            weather.tag.icon
              .frame(width: 15, height: 15)
              .foregroundStyle(Gen.Colors.gray300.color)
            
            Text(weather.temperatureString)
              .font(.fonts(.body14))
              .foregroundStyle(Gen.Colors.gray300.color)
            
            Spacer()
          }
          
          ATPageIndicator(numberOfPages: feedImages.count, currentPage: $currentPage)
        }
      }

      
      ATEmojiExpressionView(data: ATEmojiExpressionData.mockData()) {

      }
    }
    .cornerRadius(20)
  }
}
