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
import Album
import Domain

public struct MyProfileEditView: View {
  
  private let displayData: MyProfileEditData
  
  @Binding private var path: NavigationPath
  
  @State private var isShowProfileImageEdit: Bool = false
  
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
            backAction: {
              path.removeLast()
            },
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
              isShowProfileImageEdit = true
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
            path.append(MyProfileStep.nicknameEdit)
          }
          
          ATDivider(type: .extreamSmall)
          
          MyProfileEditItemView(
            icon: Gen.Images.solarRoof.image,
            label: "살고있는 도시",
            value: displayData.city,
            trailing: Gen.Images.arrowRight24.image
          )
          .onTapGesture {
            path.append(MyProfileStep.cityEdit)
          }
          
          ATDivider(type: .extreamSmall)
          
          MyProfileEditItemView(
            icon: Gen.Images.time16.image,
            label: "연락하기 편한 시간대",
            value: displayData.timeRange,
            trailing: Gen.Images.arrowRight24.image
          )
          .onTapGesture {
            path.append(MyProfileStep.preferenceTimeEdit)
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
    .fullScreenCover(isPresented: $isShowProfileImageEdit) {
      AlbumView(
        reducer: AlbumReducer(
          albumType: .single(navigationTitle: "프로필 사진 변경", completeButtonTitle: "완료"),
          albumUsecase: AlbumUsecaseImplement(recentAlbumName: "최근", favoriteAlbumName: "즐겨찾는 항목")
        ),
        complete: { imageList in
          isShowProfileImageEdit = false
        },
        close: {
          isShowProfileImageEdit = false
        })
    }
  }
}
