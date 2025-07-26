//
//  MonthRecapView.swift
//  MyProfile
//
//  Created by jinyoung on 8/7/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI
import Domain
import UIComponents
import ArchiveFoundation

public struct MonthRecapView: View {
  
  // MARK: - public state
  
  // MARK: - private properties
  private let month: String
  
  private let data: [RecapCardType]
  
  // MARK: - public properties
  public var allButtonHandler: (() -> Void)?
  
  
  
  // MARK: - life cycle
  
  public var body: some View {
    VStack {
      
      Spacer()
        .frame(height: 20)
      
      HStack {
        Text("\(month)의 어바웃타임")
          .font(.fonts(.body14))
          .foregroundStyle(Gen.Colors.white.color)
        
        Spacer()
        
        Text("모두보기")
          .font(.fonts(.buttonSemiBold14))
          .foregroundStyle(Gen.Colors.white.color)
          .onTapGesture {
            allButtonHandler?()
          }
      }
      
      Spacer()
        .frame(height: 12)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
          ForEach(data, id: \.self) { type in
            VStack {
              RecapSmallCardView(type: type)
            }
          }
        }
      }
      .frame(height: 120)
    }
    .padding(.horizontal, 20)
  }
  
  public init(
    month: String,
    data: [RecapCardType],
    allButtonHandler: (() -> Void)?
  ) {
    self.month = month
    self.data = data
    self.allButtonHandler = allButtonHandler
  }
  
  // MARK: - private method
  
  // MARK: - internal method
  
}
