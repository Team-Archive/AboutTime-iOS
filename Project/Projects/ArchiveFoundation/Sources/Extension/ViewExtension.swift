//
//  ViewExtension.swift
//  ArchiveFoundation
//
//  Created by jinyoung on 7/27/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI

extension View {
  @ViewBuilder
  public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
