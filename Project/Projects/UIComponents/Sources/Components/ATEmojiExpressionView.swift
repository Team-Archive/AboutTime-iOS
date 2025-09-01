//
//  ATEmojiExpressionView.swift
//  UIComponents
//
//  Created by jinyoung on 4/20/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation

public struct ATEmojiExpressionData: Hashable, Identifiable, Sendable {
  public let id: UUID
  public let emoji: ExpressiveEmoji
  public let selectionCount: Int
  public var isSelectedByUser: Bool
  
  public init(
    id: UUID = UUID(),
    emoji: ExpressiveEmoji,
    selectionCount: Int,
    isSelectedByUser: Bool
  ) {
    self.id = id
    self.emoji = emoji
    self.selectionCount = selectionCount
    self.isSelectedByUser = isSelectedByUser
  }
  
  public static func mockData() -> [ATEmojiExpressionData] {
    ExpressiveEmoji.allCases.map {
      ATEmojiExpressionData(
        emoji: $0,
        selectionCount: Int.random(in: 0...100),
        isSelectedByUser: false
      )
    }
  }
}

public struct ATEmojiExpressionView: View {
  
  @State private var data: [ATEmojiExpressionData]
  private var addButtonHandler: (() -> Void)?
  
  public init(
    data: [ATEmojiExpressionData] = [],
    addButtonHandler: (() -> Void)?
  ) {
    _data = State(initialValue: data)
    self.addButtonHandler = addButtonHandler
  }
  
  public var body: some View {
    FlowLayout(spacing: 6, lineSpacing: 4) {
      ForEach($data, id: \.id) { $expression in
        ATSelectableEmojiButton(
          emoji: expression.emoji,
          selectedCount: expression.selectionCount,
          isSelected: $expression.isSelectedByUser,
          action: { isSelected, count in
            expression.isSelectedByUser.toggle()
            // TODO: API 호출을 위해 action 전달하는 부분 구현 필요
          }
        )
      }
      
      ATSelectableButton(
        contentsView: Gen.Images.emoji24.image.resizable().aspectRatio(contentMode: .fit).frame(width: 20, height: 16),
        backgroundColor: Gen.Colors.purpleGray300.color,
        isSelected: .constant(false)
      ) { _ in
        addButtonHandler?()
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
