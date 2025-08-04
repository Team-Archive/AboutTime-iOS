//
//  MyProfileNickNameEditView.swift
//  MyProfile
//
//  Created by jinyoung on 8/4/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import UIComponents
import ArchiveFoundation

public struct MyProfileNickNameEditView: View {
  @State private var nickname: String = "수지"
  
  public init() {
    
  }
  
  public var body: some View {
    ZStack {
      ATBackgroundView()
        .ignoresSafeArea()
      VStack(spacing: 0) {
        ATNavigationBar(
          type: .default(
            title: "닉네임 수정",
            trailingIcon: nil,
            backAction: nil,
            trailingAction: nil
          )
        )
        .padding(.top, 8)
        
        Spacer().frame(height: 40)
        
        // 닉네임 입력
        VStack(alignment: .leading, spacing: 8) {
          Text("닉네임을 입력해주세요")
            .font(.fonts(.bodyBold14))
            .foregroundStyle(Gen.Colors.white.color)
            .padding(.leading, 4)
          
          ATUnderlineInputView(
            placeholderMessage: "",
            message: $nickname,
            isValidMessage: .constant(true)
          )
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 24)
        
        Spacer()
        
        // 저장 버튼
        ATBottomActionButton(
          designType: .secondary,
          icon: nil,
          title: "저장하기",
          action: {
            // TODO: 저장 액션
          }
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 32)
      }
    }
    .toolbar(.hidden)
  }
}

// MARK: - Preview
#Preview {
  MyProfileNickNameEditView()
}
