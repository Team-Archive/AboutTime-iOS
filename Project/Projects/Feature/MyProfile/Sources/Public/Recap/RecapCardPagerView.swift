//
//  RecapCardPagerView.swift
//  MyProfile
//
//  Created by jinyoung on 7/27/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI

public struct RecapCardPagerView: View {
  private let cards: [RecapCardType]
  @Binding private var currentIndex: Int
  
  private enum Metric {
    static let width: CGFloat = 280
    static let height: CGFloat = 420
    static let spacing: CGFloat = 16
  }
  
  public var body: some View {
    VStack(spacing: Metric.spacing) {
      GeometryReader { geo in
        HStack(spacing: Metric.spacing) {
          ForEach(Array(cards.enumerated()), id: \.offset) { idx, card in
            RecapLargeCardView(type: card, isFocused: currentIndex == idx)
              .frame(width: Metric.width, height: Metric.height)
              .scaleEffect(1)
              .animation(.spring(), value: currentIndex)
          }
        }
        .padding(.horizontal, (geo.size.width - Metric.width) / 2)
        .contentShape(Rectangle())
        .offset(x: -CGFloat(currentIndex) * (Metric.width + Metric.spacing))
        .gesture(
          DragGesture()
            .onEnded { value in
              let threshold: CGFloat = 40
              var newIndex = currentIndex
              
              if value.translation.width < -threshold {
                newIndex = min(currentIndex + 1, cards.count - 1)
              } else if value.translation.width > threshold {
                newIndex = max(currentIndex - 1, 0)
              }
              currentIndex = newIndex
            }
        )
        .animation(.easeInOut, value: currentIndex)
      }
      .frame(height: Metric.height)
      
      RecapCardPageIndicator(max: cards.count, currentIndex: currentIndex)
    }
  }
  
  public init(cards: [RecapCardType], currentIndex: Binding<Int>) {
    self.cards = cards
    self._currentIndex = currentIndex
  }
}
