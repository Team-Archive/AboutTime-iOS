//
//  PostItemView.swift
//  Calendar
//
//  Created by jinyoung on 6/1/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import UIComponents
import ArchiveFoundation

public struct PostItemData: Sendable {
  public let imageList: [ATGridImageView.ATGridImageItem]
  public let emojiList: [ATEmojiExpressionData]
  
  public var isEmpty: Bool {
    imageList.isEmpty && emojiList.isEmpty
  }
  
  public init(
    imageList: [ATGridImageView.ATGridImageItem],
    emojiList: [ATEmojiExpressionData]
  ) {
    self.imageList = imageList
    self.emojiList = emojiList
  }
  
  public static func mockData(imageCount: Int) -> PostItemData {
    PostItemData(
      imageList: MockImageURL.fetchDatas(with: imageCount)
      .compactMap { ATGridImageView.ATGridImageItem(url: $0) },
      emojiList: ExpressiveEmoji.allCases.map {
        ATEmojiExpressionData(
          emoji: $0,
          selectionCount: Int.random(in: 0...100),
          isSelectedByUser: false
        )
      })
  }
}

public struct PostItemView: View {
  
  private let geometry: GeometryProxy
  
  private let data: PostItemData
  
  public init(geometry: GeometryProxy, data: PostItemData) {
    self.geometry = geometry
    self.data = data
  }
  
  public var body: some View {
      ATGridImageView(
        geometry: geometry,
        data: data.imageList,
        tapHandler: { item in
        print("Tap Grid Image View : \(item)")
      }).padding(.horizontal, 20)


      ATEmojiExpressionView(
        geometry: geometry,
        data: data.emojiList
      ) {
          print("Tap Add Button")
        }
  }
}
