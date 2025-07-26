//
//  RecapTextData.swift
//  MyProfile
//
//  Created by jinyoung on 7/20/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents
import ArchiveFoundation

public struct RecapTextData: Sendable, Hashable {
  let content: String
  let count: Int
  let type: RecapTextType
  
  public init(content: String, count: Int, type: RecapTextType) {
    self.content = content
    self.count = count
    self.type = type
  }
}

public enum RecapTextType: Sendable, Hashable {
  /// 가장 많이 소통한 시간대
  case timeRange
  /// 가장 많이 소통한 날
  case day
  /// 소식 횟수
  case upload
  
  public var title: [String] {
    switch self {
    case .timeRange:
      ["소통을 많이 한", "시간대"]
    case .day:
      ["이번 달 가장", "많이 소통한 날"]
    case .upload:
      ["이번 달 내가", "보낸 소식 횟수"]
    }
  }
  
  public var highlightText: [String] {
    switch self {
    case .timeRange: ["시간대"]
    case .day: ["소통한 날"]
    case .upload: ["소식 횟수"]
    }
  }
  
  public var icon: Image {
    switch self {
    case .timeRange: Gen.Images.recapClock.image
    case .day: Gen.Images.recapCalendar.image
    case .upload: Gen.Images.recapLetter.image
    }
  }
  
  public var emoji: RecapEmoji {
    switch self {
    case .timeRange: .eightOClock
    case .day: .tearOffCalendar
    case .upload: .loveLetter
    }
  }
  
  public func makeDescription(_ count: Int) -> String {
    switch self {
    case .timeRange: "\(count)번의 소통"
    case .day: "\(count)번의 리액션"
    case .upload: "\(count)번의 소통"
    }
  }
}
