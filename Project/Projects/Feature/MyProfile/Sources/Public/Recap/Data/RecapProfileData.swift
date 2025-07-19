//
//  RecapProfileData.swift
//  MyProfile
//
//  Created by jinyoung on 7/20/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents

public struct RecapProfileData: Sendable, Hashable {
  let imageURL: URL
  let type: RecapProfileType
  
  public init(imageURL: URL, type: RecapProfileType) {
    self.imageURL = imageURL
    self.type = type
  }
}

public enum RecapProfileType: Sendable, Hashable {
  /// 가장 많이 소통한 친구
  case communicate
  /// 가장 많이 리액션을 보낸 친구
  case reaction
  
  public var title: [String] {
    switch self {
    case .communicate:
      ["이번 달 가장", "많이 소통한 친구"]
    case .reaction:
      ["리액션을 가장", "많이 보낸 친구"]
    }
  }
  
  public var highlightText: [String] {
    switch self {
    case .communicate: ["소통한 친구"]
    case .reaction: ["리액션", "친구"]
    }
  }
  
  public var icon: Image {
    switch self {
    case .communicate: Gen.Images.recapHandshake.image
    case .reaction: Gen.Images.recapFoldedHands.image
    }
  }
}
