//
//  HighLightText.swift
//  UIComponents
//
//  Created by jinyoung on 7/10/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI

public struct HighLightText: View {
  let text: String
  let textColor: Color
  let font: Font
  let highlightStrings: [String]
  let highlightColor: Color
  var highlightFont: Font?
  
  public init(
      text: String,
      textColor: Color,
      font: Font,
      highlightStrings: [String],
      highlightColor: Color,
      highlightFont: Font? = nil
  ) {
    self.text = text
    self.textColor = textColor
    self.font = font
    self.highlightStrings = highlightStrings
    self.highlightColor = highlightColor
    self.highlightFont = highlightFont
  }
  
  public var body: some View {
    highlightingText
  }
  
  private var highlightingText: Text {
    guard !highlightStrings.isEmpty else {
      return unmatchText(text)
    }

    let ranges = highlightStrings
      .flatMap { string in text.ranges(of: string) }
      .sorted(by: { $0.lowerBound < $1.lowerBound })

    var resultText = Text("")
    var currentIndex = text.startIndex

    for range in ranges {
      if currentIndex < range.lowerBound {
        let unmatch = String(text[currentIndex..<range.lowerBound])
        resultText = resultText + unmatchText(unmatch)
      }

      let match = String(text[range])
      resultText = resultText + matchText(match)
      currentIndex = range.upperBound
    }

    if currentIndex < text.endIndex {
      let unmatch = String(text[currentIndex..<text.endIndex])
      resultText = resultText + unmatchText(unmatch)
    }

    return resultText
  }
  
  private func unmatchText(_ string: String) -> Text {
    Text(string)
      .font(font)
      .foregroundColor(textColor)
  }
  
  private func matchText(_ string: String) -> Text {
    Text(string)
      .font(highlightFont)
      .foregroundColor(highlightColor)
  }
}
