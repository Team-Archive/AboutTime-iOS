//
//  MyProfileEditView.swift
//  MyProfile
//
//  Created by jinyoung on 8/4/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import UIComponents
import ArchiveFoundation

public struct MyProfileEditView: View {
  let displayData: MyProfileEditData
  @Binding var path: NavigationPath
  
  public init(
    displayData: MyProfileEditData,
    path: Binding<NavigationPath>
  ) {
    self.displayData = displayData
    self._path = path
  }
  
  public var body: some View {
    ZStack {
      ATBackgroundView()
        .ignoresSafeArea()
      VStack(spacing: 0) {
        ATNavigationBar(
          type: .default(
            title: "프로필 변경",
            trailingIcon: nil,
            backAction: nil,
            trailingAction: nil
          )
        )
        .padding(.top, 8)
        
        ZStack(alignment: .bottomTrailing) {
          ATUrlImage(url: displayData.profileImageURL)
            .aspectRatio(contentMode: .fill)
            .frame(width: 160, height: 160)
            .clipShape(Circle())
            .background(Circle().fill(Gen.Colors.gray200.color))
          ATRoundIconButton(
            icon: Gen.Images.gallery.image,
            backgroundColor: Gen.Colors.point.color,
            action: {
              // TODO: 프로필 이미지 수정 화면 이동
            }
          )
          .frame(width: 44, height: 44)
        }
        .padding(.top, 32)
        .padding(.bottom, 32)
        
        VStack(spacing: 0) {
          MyProfileEditItemView(
            icon: Gen.Images.user24.image,
            label: "닉네임",
            value: displayData.nickname,
            trailing: Gen.Images.arrowRight24.image
          )
          .onTapGesture {
            path.append(MyProfileStep.nicknameEdit.rawValue)
          }
          
          ATDivider(type: .extreamSmall)
          
          MyProfileEditItemView(
            icon: Gen.Images.solarRoof.image,
            label: "살고있는 도시",
            value: displayData.city,
            trailing: Gen.Images.arrowRight24.image
          )
          .onTapGesture {
            path.append(MyProfileStep.cityEdit.rawValue)
          }
          
          ATDivider(type: .extreamSmall)
          
          MyProfileEditItemView(
            icon: Gen.Images.time16.image,
            label: "연락하기 편한 시간대",
            value: displayData.timeRange,
            trailing: Gen.Images.arrowRight24.image
          )
          .onTapGesture {
            path.append(MyProfileStep.preferenceTimeEdit.rawValue)
          }
        }
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Gen.Colors.purpleGray400.color)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
        
        Spacer()
      }
    }
    .toolbar(.hidden)
  }
}
