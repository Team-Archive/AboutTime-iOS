//
//  LocalizedTime+Extension.swift
//  UIComponents
//
//  Created by 김진영 on 8/19/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation
import ArchiveFoundation

extension LocalizedTime {
  public var toGradient: ATGradientView.ATGradientType {
    let components = Calendar.current.dateComponents(in: timeZone, from: Date(timeIntervalSince1970: utcTimestamp))
    let hour = components.hour ?? 0
    
    switch hour {
    case 6..<12:
      return .morning
    case 12..<17:
      return .afternoon
    case 17..<21:
      return .evening
    default:
      return .night
    }
  }
}
