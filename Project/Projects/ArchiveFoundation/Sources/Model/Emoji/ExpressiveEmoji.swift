//
//  ExpressiveEmoji.swift
//  ArchiveFoundation
//
//  Created by Aaron Hanwe LEE on 4/25/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import Foundation

public enum ExpressiveEmoji: CaseIterable, EmojiSelectable {
  case clappingHands
  case faceWithTearsOfJoy
  case grinningFace
  case kissingFaceWithClosedEyes
  case loudlyCryingFace
  case partyPopper
  case redHeart
  case smilingFaceWithHeartEyes
  case smilingFaceWithHearts
  case thumbsUp

  public var name: String {
    switch self {
    case .clappingHands:
      return "ClappingHands"
    case .faceWithTearsOfJoy:
      return "FaceWithTearsOfJoy"
    case .grinningFace:
      return "GrinningFace"
    case .kissingFaceWithClosedEyes:
      return "KissingFaceWithClosedEyes"
    case .loudlyCryingFace:
      return "LoudlyCryingFace"
    case .partyPopper:
      return "PartyPopper"
    case .redHeart:
      return "RedHeart"
    case .smilingFaceWithHeartEyes:
      return "SmilingFaceWithHeartEyes"
    case .smilingFaceWithHearts:
      return "SmilingFaceWithHearts"
    case .thumbsUp:
      return "ThumbsUp"
    }
  }
}
