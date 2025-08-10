//
//  MyProfileStep.swift
//  MyProfile
//
//  Created by jinyoung on 8/5/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation

public enum MyProfileStep {
  /// 프로필 편집
  case profileEdit
  /// 프로필 편집 > 닉네임 변경
  case nicknameEdit
  /// 프로필 편집 > 도시 변경
  case cityEdit
  /// 프로필 편집 > 연락하기 편한 시간대 변경
  case preferenceTimeEdit
  
  /// Recap > 모두보기
  case recapAll
}
