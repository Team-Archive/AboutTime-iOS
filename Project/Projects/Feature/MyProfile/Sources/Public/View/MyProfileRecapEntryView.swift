//
//  MyProfileRecapEntryView.swift
//  MyProfile
//
//  Created by jinyoung on 7/28/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents
import ArchiveFoundation

public struct MyProfileRecapEntryView: View {
  @State private var currentCardIndex: Int = 0
  
  private let month: String
  private let cards: [RecapCardType]
  
  public var body: some View {
    VStack {
      ATNavigationBar(
        type: .default(
          title: "\(month)의 어바웃타임",
          backAction: {},
          trailingAction: nil
        )
      )
      
      HStack {
        HighLightText(
          text: "지구 반대편의 친구와\n소통한 시간을 되돌아 보세요",
          textColor: Gen.Colors.white.color,
          font: .fonts(.title24),
          highlightStrings: ["소통한 시간"],
          highlightColor: Gen.Colors.white.color,
          highlightFont: .fonts(.title24)
        )
        
        Spacer()
      }
      .padding(.horizontal, 20)
      
      Spacer(minLength: 40)
      
      HStack(spacing: 2) {
        Text("\(currentCardIndex + 1)")
          .foregroundStyle(Gen.Colors.white.color)
          .font(.fonts(.bodyBold16))
        Text("/\(cards.count)")
          .foregroundStyle(Gen.Colors.gray600.color)
          .font(.fonts(.body14))
        
        Spacer()
      }
      .padding(.horizontal, 20)
      
      RecapCardPagerView(
        cards: cards,
        currentIndex: $currentCardIndex
      )
      
      Spacer()
    }
    .background(Gen.Colors.backgroundEnd.color)
    .toolbar(.hidden)
  }
  
  public init(
    month: String,
    cards: [RecapCardType]
  ) {
    self.month = month
    self.cards = cards
  }
}
