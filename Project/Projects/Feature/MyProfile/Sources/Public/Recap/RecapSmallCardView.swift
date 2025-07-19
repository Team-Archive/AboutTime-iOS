//
//  RecapSmallCardView.swift
//  MyProfile
//
//  Created by jinyoung on 7/9/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents


public struct RecapSmallCardView: View {
  
  let type: RecapCardType

  
  public init(type: RecapCardType) {
    self.type = type
  }

  public var body: some View {
    ZStack {
      switch type {
      case .profile(let data):
        VStack(alignment: .leading, spacing: 12) {
          VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 2) {
              data.type.icon
                .frame(width: 16, height: 16)
              HighLightText(
                text: data.type.title[0],
                textColor: Gen.Colors.white.color,
                font: .fonts(.body13),
                highlightStrings: data.type.highlightText,
                highlightColor: Gen.Colors.point.color,
                highlightFont: .fonts(.body13)
              )
            }
            
            HighLightText(
              text: data.type.title[1],
              textColor: Gen.Colors.white.color,
              font: .fonts(.body13),
              highlightStrings: data.type.highlightText,
              highlightColor: Gen.Colors.point.color,
              highlightFont: .fonts(.body13)
            )
          }
          
          HStack(alignment: .center) {
            Spacer()
            ATUrlImage(url: data.imageURL)
              .aspectRatio(contentMode: .fill)
              .frame(width: 52, height: 52)
              .clipShape(Circle())
              .overlay(content: {
                Circle()
                  .stroke(lineWidth: 2)
                  .foregroundStyle(Gen.Colors.point.color)
              })
            Spacer()
          }
        }
      case .post(let data):
        VStack(alignment: .leading, spacing: 12) {
          VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 2) {
              data.type.icon
                .frame(width: 16, height: 16)
              HighLightText(
                text: data.type.title[0],
                textColor: Gen.Colors.white.color,
                font: .fonts(.body13),
                highlightStrings: data.type.highlightText,
                highlightColor: Gen.Colors.point.color,
                highlightFont: .fonts(.body13)
              )
            }
            
            HighLightText(
              text: data.type.title[1],
              textColor: Gen.Colors.white.color,
              font: .fonts(.body13),
              highlightStrings: data.type.highlightText,
              highlightColor: Gen.Colors.point.color,
              highlightFont: .fonts(.body13)
            )
          }
          
          HStack(alignment: .center) {
            Spacer()
            ATUrlImage(url: data.imageURL)
              .aspectRatio(contentMode: .fill)
              .frame(width: 52, height: 52)
              .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
              .overlay(content: {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .stroke(lineWidth: 2)
                  .foregroundStyle(Gen.Colors.point.color)
              })
            Spacer()
          }
        }
      case .text(let data):
        VStack(alignment: .leading, spacing: 12) {
          VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 2) {
              data.type.icon
                .frame(width: 16, height: 16)
              HighLightText(
                text: data.type.title[0],
                textColor: Gen.Colors.white.color,
                font: .fonts(.body13),
                highlightStrings: data.type.highlightText,
                highlightColor: Gen.Colors.point.color,
                highlightFont: .fonts(.body13)
              )
            }
            
            HighLightText(
              text: data.type.title[1],
              textColor: Gen.Colors.white.color,
              font: .fonts(.body13),
              highlightStrings: data.type.highlightText,
              highlightColor: Gen.Colors.point.color,
              highlightFont: .fonts(.body13)
            )
          }
          
          Spacer()

          HStack {
            Text(data.content)
              .padding(.all, 8)
              .font(.fonts(.bodyBold16))
              .foregroundStyle(Gen.Colors.purpleGray500.color)
              .background(Gen.Colors.point.color)
              .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Spacer()
          }
        }
      }
    }
    .padding(.all, 12)
    .frame(width: 124, height: 124)
    .background(Gen.Colors.purpleGray500.color)
    .overlay(content: {
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .stroke(lineWidth: 2                                  )
        .foregroundStyle(Gen.Colors.purpleGray300.color)
    })
    .clipShape(RoundedRectangle(cornerRadius: 12))
  }
}
