//
//  RecapLargeCardView.swift
//  MyProfile
//
//  Created by jinyoung on 7/21/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents

public struct RecapLargeCardView: View {
  
  private let type: RecapCardType
  private let isFocused: Bool
  
  public var body: some View {
    ZStack {
      ATBackgroundView()
        .clipShape(.rect(cornerRadius: 28))
        .if(isFocused) {
          $0
            .overlay(
              RoundedRectangle(cornerRadius: 28)
                .stroke(Gen.Colors.point.color, lineWidth: 2)
            )
            .shadow(color: Gen.Colors.point.color, radius: 10, x: 0, y: 4)
        }
        .if(!isFocused) {
          $0
            .overlay(
              RoundedRectangle(cornerRadius: 28)
                .stroke(Gen.Colors.purpleGray200.color, lineWidth: 2)
            )
        }
        .overlay {
          switch type {
          case .profile(let data):
            VStack(alignment: .center) {
              HStack {
                makeTitleView(
                  title: data.type.title,
                  highlightStrings: data.type.highlightText
                )
                
                Spacer()
              }
              
              Spacer(minLength: 36)
              
              ATUrlImage(url: data.imageURL)
                .aspectRatio(contentMode: .fill)
                .clipShape(.circle)
                .frame(width: 148, height: 148)
              
              Spacer(minLength: 28)
              
              Text(data.name)
                .font(.fonts(.title40))
                .foregroundStyle(Gen.Colors.white.color)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
              
              Spacer()
              
              Text(data.type.makeDescription(data.count))
                .font(.fonts(.body16))
                .foregroundStyle(Gen.Colors.gray200.color)
                .minimumScaleFactor(0.6)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 28)
          case .post(let data):
            VStack(alignment: .center) {
              HStack {
                makeTitleView(
                  title: data.type.title,
                  highlightStrings: data.type.highlightText
                )
                
                Spacer()
              }
              
              Spacer(minLength: 36)
              
              ATUrlImage(url: data.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 148, height: 148)
                .clipShape(.rect(cornerRadius: 12))
              
              Spacer(minLength: 28)
              
              HStack(spacing: 12) {
                ATEmojiView(resource: .thumbsUp)
                ATEmojiView(resource: .smilingFaceWithHeartEyes)
                ATEmojiView(resource: .redHeart)
              }
              .frame(height: 40)
              
              Spacer()
              
              Text(data.type.makeDescription(data.count))
                .font(.fonts(.body16))
                .foregroundStyle(Gen.Colors.gray200.color)
                .minimumScaleFactor(0.6)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 28)
          case .text(let data):
            VStack(alignment: .center) {
              HStack {
                makeTitleView(
                  title: data.type.title,
                  highlightStrings: data.type.highlightText
                )
                
                Spacer()
              }
              
              Spacer(minLength: 36)
              
              ATEmojiView(resource: data.type.emoji)
                .frame(width: 148, height: 148)
              
              Spacer(minLength: 28)
              
              Text(data.content)
                .font(.fonts(.title40))
                .foregroundStyle(Gen.Colors.white.color)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
              
              Spacer()
              
              Text(data.type.makeDescription(data.count))
                .font(.fonts(.body16))
                .foregroundStyle(Gen.Colors.gray200.color)
                .minimumScaleFactor(0.6)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 28)
          }
        }
    }
    .frame(width: 260, height: 420)
  }
  
  private func makeTitleView(
    title: [String],
    highlightStrings: [String]
  ) -> some View {
    VStack(alignment: .leading) {
      ForEach(title, id: \.self) { text in
        HighLightText(
          text: text,
          textColor: Gen.Colors.white.color,
          font: .fonts(.title20),
          highlightStrings: highlightStrings,
          highlightColor: Gen.Colors.point.color,
          highlightFont: .fonts(.title20)
        )
      }
    }
  }
  
  public init(type: RecapCardType, isFocused: Bool) {
    self.type = type
    self.isFocused = isFocused
  }
}
