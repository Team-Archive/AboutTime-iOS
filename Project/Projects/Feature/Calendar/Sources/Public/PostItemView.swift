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
import Domain

public struct PostItemData: Sendable {
  public let imageList: [ATGridImageView.ATGridImageItem]
  public let emojiList: [ATEmojiExpressionData]
  public let dateText: String
  public let weatherData: Weather

  public init(
    imageList: [ATGridImageView.ATGridImageItem],
    emojiList: [ATEmojiExpressionData],
    dateText: String,
    weatherData: Weather
  ) {
    self.imageList = imageList
    self.emojiList = emojiList
    self.dateText = dateText
    self.weatherData = weatherData
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
      },
      dateText: "6시간 전",
      weatherData: .init(tag: .cloudy, temperature: 15)
    )
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
    VStack {
      ATGridImageView(
        geometry: geometry,
        data: data.imageList,
        tapHandler: { item in
          print("Tap Grid Image View : \(item)")
        }).padding(.horizontal, 20)
      
      HStack {
        Text(data.dateText)
          .font(.fonts(.body12))
          .foregroundStyle(Gen.Colors.gray300.color)
        
        // TODO: Weather 뷰 디자인 반영 필요
        ATWeatherTagView(
          designType: .primary,
          weather: data.weatherData
        )
        
        Spacer()
      }
      .padding(.horizontal, 20)
      
      ATEmojiExpressionView(
        geometry: geometry,
        data: data.emojiList
      ) {
        print("Tap Add Button")
      }
    }
  }
}
