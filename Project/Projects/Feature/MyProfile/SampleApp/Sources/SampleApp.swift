//
//  SampleApp.swift
//  MyProfile
//
//  Created by jinyoung on 7/16/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation
import Domain
import Calendar
import UIComponents
import MyProfile
import ComposableArchitecture

@main
struct SampleApp: App {
  var body: some Scene {
    WindowGroup {
      MyProfileEntryView()
    }
  }
}
