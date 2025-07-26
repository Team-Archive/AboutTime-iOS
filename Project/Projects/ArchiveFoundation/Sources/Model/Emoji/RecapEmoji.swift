//
//  RecapEmoji.swift
//  ArchiveFoundation
//
//  Created by jinyoung on 7/21/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation

public enum RecapEmoji: EmojiSelectable {
  case eightOClock
  case loveLetter
  case tearOffCalendar
  
  public var name: String {
    switch self {
    case .eightOClock:
      return "EightOClock"
    case .loveLetter:
      return "LoveLetter"
    case .tearOffCalendar:
      return "TearOffCalendar"
    }
  }
}
