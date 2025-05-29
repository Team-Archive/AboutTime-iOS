//
//  ATSelectableEmojiButton.swift
//  UIComponents
//
//  Created by Aaron Hanwe LEE on 4/25/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation
import Combine

public struct ATSelectableEmojiButton: View {
  
  // MARK: - public state
  
  @Binding var isEnabled: Bool
  @Binding var isSelected: Bool
  
  // MARK: - private properties
  
  @State var selectedCount: Int
  private let emoji: ExpressiveEmoji
  
  // MARK: - public properties
  
  public var action: (_ isSelected: Bool, _ count: Int) -> Void
  
  // MARK: - life cycle
  
  public var body: some View {
    
    ATSelectableButton(
      contentsView: ATSelectableEmojiContentsView(
        emoji: self.emoji,
        count: self.$selectedCount
      ),
      backgroundColor: Gen.Colors.purpleGray300.color,
      isSelected: $isSelected
    ) { isSelected in
      selectedCount += isSelected ? -1 : 1
      selectedCount = max(selectedCount, 0)
      self.action(isSelected, selectedCount)
    }

  }
  
  public init(
    emoji: ExpressiveEmoji,
    selectedCount: Int,
    isSelected: Binding<Bool>,
    action: @escaping (_ isSelected: Bool, _ count: Int) -> Void,
    isEnabled: Binding<Bool> = .constant(true)
  ) {
    self.emoji = emoji
    self.selectedCount = selectedCount
    self._isSelected = isSelected
    self._isEnabled = isEnabled
    self.action = action
  }
  
  
  // MARK: - private method
  
  // MARK: - internal method
  
}

public struct ATSelectableEmojiContentsView: View {
  
  // MARK: - public state
  
  // MARK: - private properties
  
  @Binding private var count: Int
  private let emoji: ExpressiveEmoji
  
  private let font: Font = .fonts(.body13)
  private let textColor: Color = Gen.Colors.white.color
  
  // MARK: - public properties
  
  // MARK: - life cycle
  
  public var body: some View {
    
    HStack(spacing: 2) {
      ATEmojiView(resource: emoji)
        .frame(width: 16, height: 16)
      
      Text("\(count)")
        .font(self.font)
        .fontDesign(.monospaced)
        .foregroundStyle(textColor)
        .lineLimit(1)
    }
    
  }
  
  public init(
    emoji: ExpressiveEmoji,
    count: Binding<Int>
  ) {
    self.emoji = emoji
    self._count = count
  }
  
  // MARK: - private method
  
  // MARK: - internal method
  
}

#Preview {
  
  VStack {
    ATSelectableEmojiButton(emoji: .redHeart, selectedCount: 10, isSelected: .constant(false)) { isSelected, count in
      print("hola: \(isSelected) \(count)")
    }
  }
  
}
