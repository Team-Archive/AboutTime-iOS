//
//  ElapsedTimeFormatter.swift
//  ArchiveFoundation
//
//  Created by jinyoung on 9/7/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation

public struct ElapsedTimeFormatter {
  public static func format(current: TimeInterval, target: TimeInterval) -> String {
    let diff = Int(current - target)
    guard diff >= 0 else { return "" }
    
    let minutes = diff / 60
    if minutes < 60 {
      return "\(minutes)분 전"
    }
    
    let hours = minutes / 60
    if hours < 24 {
      return "\(hours)시간 전"
    }
    
    let days = hours / 24
    return "\(days)일 전"
  }
}
