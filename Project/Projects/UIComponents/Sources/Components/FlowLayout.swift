//
//  FlowLayout.swift
//  UIComponents
//
//  Created by jinyoung on 5/18/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI

public struct FlowLayout: Layout {
  
  public struct Cache {
    var sizes: [CGSize] = []
    var spacing: [CGFloat] = []
  }
  
  private let spacing: CGFloat
  private let lineSpacing: CGFloat
  
  public init(
    spacing: CGFloat,
    lineSpacing: CGFloat
  ) {
    self.spacing = spacing
    self.lineSpacing = lineSpacing
  }
  
  public func makeCache(subviews: Subviews) -> Cache {
    let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
    let spacing: [CGFloat] = subviews.indices.map { index in
      guard index != subviews.count - 1 else {
        return 0
      }
      
      return subviews[index].spacing.distance(
        to: subviews[index+1].spacing,
        along: .horizontal
      )
    }
    
    return Cache(sizes: sizes, spacing: spacing)
  }
  
  public func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Cache
  ) -> CGSize {
    var totalHeight: CGFloat = .zero
    var totalWidth: CGFloat = .zero
    
    var lineWidth: CGFloat = .zero
    var lineHeight: CGFloat = .zero
    
    for index in subviews.indices {
      if lineWidth + cache.sizes[index].width > proposal.width ?? 0 {
        totalHeight += lineHeight + lineSpacing // 줄 간격 추가
        lineWidth = cache.sizes[index].width
        lineHeight = cache.sizes[index].height
      } else {
        lineWidth += cache.sizes[index].width + spacing
        lineHeight = max(lineHeight, cache.sizes[index].height)
      }
      
      totalWidth = max(totalWidth, lineWidth)
    }
    
    totalHeight += lineHeight
    
    return .init(width: totalWidth, height: totalHeight)
  }
  
  public func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Cache
  ) {
    var lineX = bounds.minX
    var lineY = bounds.minY
    var lineHeight: CGFloat = .zero
    
    let tolerance: CGFloat = 2.0
    
    for index in subviews.indices {
      let spacingAfter = (index < subviews.count - 1) ? spacing : .zero
      let projectedWidth = lineX + cache.sizes[index].width
      
      if projectedWidth > (proposal.width ?? .zero) - tolerance {
        lineY += lineHeight + lineSpacing // 줄 간격 추가
        lineHeight = .zero
        lineX = bounds.minX
      }
      
      let position = CGPoint(
        x: lineX + cache.sizes[index].width / 2,
        y: lineY + cache.sizes[index].height / 2
      )
      
      lineHeight = max(lineHeight, cache.sizes[index].height)
      lineX += cache.sizes[index].width + spacingAfter
      
      subviews[index].place(
        at: position,
        anchor: .center,
        proposal: ProposedViewSize(cache.sizes[index])
      )
    }
  }
}
