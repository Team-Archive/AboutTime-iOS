//
//  RecapPostData.swift
//  MyProfile
//
//  Created by jinyoung on 7/20/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents

public struct RecapPostData: Sendable, Hashable {
  let imageURL: URL
  let type: RecapPostType
  
  public init(imageURL: URL, type: RecapPostType) {
    self.imageURL = imageURL
    self.type = type
  }
}

public enum RecapPostType: Sendable, Hashable {
  /// 가장 많이 리액션을 받은 post
  case reaction
  
  public var title: [String] {
    switch self {
    case .reaction:
      ["리액션을 많이", "받은 내 사진"]
    }
  }
  
  public var highlightText: [String] {
    switch self {
    case .reaction: ["리액션", "사진"]
    }
  }
  
  public var icon: Image {
    switch self {
    case .reaction: Gen.Images.recapCamera.image
    }
  }
}
