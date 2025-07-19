//
//  RecapCardType.swift
//  MyProfile
//
//  Created by jinyoung on 7/9/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import UIComponents

public enum RecapCardType: Sendable, Hashable {
  case profile(RecapProfileData)
  case post(RecapPostData)
  case text(RecapTextData)
}
