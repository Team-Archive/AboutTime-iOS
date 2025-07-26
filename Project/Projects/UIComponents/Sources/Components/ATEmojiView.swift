//
//  ATEmojiView.swift
//  UIComponents
//
//  Created by jinyoung on 2/15/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import ArchiveFoundation

public struct ATEmojiView: View {
  
  private let resource: EmojiSelectable
  
  public var body: some View {
    AnimatedImage(name: resource.name, bundle: UIComponentsResources.bundle)
    .resizable()
    .scaledToFit()
  }
  
  public init(resource: ExpressiveEmoji) {
    self.resource = resource
  }
  
  public init(resource: RecapEmoji) {
    self.resource = resource
  }
}
