//
//  FriendsListView.swift
//  Home
//
//  Created by jinyoung on 9/7/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import UIComponents

public struct FriendsListData: Sendable {
  public let friendsItems: [Profile]
}

struct FriendsListView: View {
  
  @Binding private var data: FriendsListData
  
  @Binding private var isShowOnlyActiveFriends: Bool
  
  init(
    data: Binding<FriendsListData>,
    isShowOnlyActiveFriends: Binding<Bool>
  ) {
    _data = data
    _isShowOnlyActiveFriends = isShowOnlyActiveFriends
  }
  
  var body: some View {
    ZStack {
      VStack(spacing: 8) {
        ForEach(data.friendsItems, id: \.userID) { profile in
          FriendStatusView(data: profile)
        }
      }
    }
  }
}
