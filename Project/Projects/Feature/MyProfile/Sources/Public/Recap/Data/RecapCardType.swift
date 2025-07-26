//
//  RecapCardType.swift
//  MyProfile
//
//  Created by jinyoung on 7/9/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

public enum RecapCardType: Sendable, Hashable {
  case profile(RecapProfileData)
  case post(RecapPostData)
  case text(RecapTextData)
}

extension RecapCardType {
  static public func mockData() -> [RecapCardType] {
    [
      .profile(
        RecapProfileData(
          imageURL: MockImageURL.fetchDatas(with: 1).first!,
          name: "포차코",
          count: Range(1...99).randomElement()!,
          type: .communicate
        )
      ),
      .profile(
        RecapProfileData(
          imageURL: MockImageURL.fetchDatas(with: 1).first!,
          name: "한교동",
          count: Range(1...99).randomElement()!,
          type: .reaction
        )
      ),
      .post(
        RecapPostData(
          imageURL: MockImageURL.fetchDatas(with: 1).first!,
          count: Range(1...99).randomElement()!,
          type: .reaction
        )
      ),
      .text(
        RecapTextData(
          content: "6PM-9PM",
          count: Range(1...99).randomElement()!,
          type: .timeRange
        )
      ),
      .text(
        RecapTextData(
          content: "7월 7일",
          count: Range(1...99).randomElement()!,
          type: .day
        )
      ),
      .text(
        RecapTextData(
          content: "30회",
          count: Range(1...99).randomElement()!,
          type: .upload
        )
      )
    ]
  }
}
