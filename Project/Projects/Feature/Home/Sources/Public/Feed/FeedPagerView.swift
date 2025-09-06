//
//  FeedPagerView.swift
//  Home
//
//  Created by jinyoung on 9/7/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

struct FeedPagerView: View {
  
  private enum Metric {
    static let spacing: CGFloat = 8
    static let dragThreshold: CGFloat = 40
  }
  
  @Binding var currentIndex: Int
  @State private var dragOffset: CGFloat = 0
  
  private let images: [URL]
  
  public init(images: [URL], currentIndex: Binding<Int>) {
    self.images = images
    self._currentIndex = currentIndex
  }
  
  var body: some View {
    VStack(spacing: 0) {
      GeometryReader { geo in
        HStack(spacing: Metric.spacing) {
          ForEach(Array(images.enumerated()), id: \.offset) { idx, url in
            ATUrlImage(url: url)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: geo.size.width, height: geo.size.width)
              .clipShape(.rect(cornerRadius: 16))
              .contentShape(Rectangle())
              .scaleEffect(1)
              .animation(.spring(), value: currentIndex)
          }
        }
        .offset(x: -CGFloat(currentIndex) * (geo.size.width + Metric.spacing) + dragOffset)
        .gesture(
          DragGesture()
            .onChanged { value in
              dragOffset = value.translation.width
            }
            .onEnded { value in
              var newIndex = currentIndex
              
              if value.translation.width < -Metric.dragThreshold {
                newIndex = min(currentIndex + 1, images.count - 1)
              } else if value.translation.width > Metric.dragThreshold {
                newIndex = max(currentIndex - 1, 0)
              }
              withAnimation(.easeInOut) {
                currentIndex = newIndex
                dragOffset = 0
              }
            }
        )
        .animation(.easeInOut, value: currentIndex)
      }
      .aspectRatio(1, contentMode: .fit)
    }
  }
}
