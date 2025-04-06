//
//  ATSelectableEmojiListSampleView.swift
//  UIComponentsSampleApp
//
//  Created by jinyoung on 3/31/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

struct ATSelectableEmojiListSampleView: View {
  private let columns = [
    GridItem(.adaptive(minimum: 60))
  ]
  
  @State private var selectedStates: [ExpressiveEmoji: Bool] = {
    var dict: [ExpressiveEmoji: Bool] = [:]
    for emoji in ExpressiveEmoji.allCases {
      dict[emoji] = false
    }
    return dict
  }()

  var body: some View {
    LazyVGrid(columns: columns, spacing: 6) {
      ForEach(ExpressiveEmoji.allCases, id: \.self) { emoji in
        ATSelectableEmojiButton(
          emoji: emoji,
          selectedCount: 100,
          isSelected: Binding(
            get: { selectedStates[emoji] ?? false },
            set: { newValue in
              selectedStates[emoji] = newValue
              print("\(emoji): \(newValue)")
            }
          ),
          action: { isSelected, count in
            selectedStates[emoji]?.toggle()
            print("Button: \(emoji) \(isSelected) \(count)")
          }
        )
      }
    }
    .padding()
  }
}
