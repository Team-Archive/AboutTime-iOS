//
//  SampleApp.swift
//  Home
//
//  Created by jinyoung on 8/12/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ArchiveFoundation
import Home

@main
struct SampleApp: App {
  var body: some Scene {
    WindowGroup {
      FriendStatusView(data: Profile.mockData())
    }
  }
}
