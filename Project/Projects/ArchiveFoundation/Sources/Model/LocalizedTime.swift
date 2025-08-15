//
//  LocalizedTime.swift
//  ArchiveFoundation
//
//  Created by jinyoung on 8/15/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import Foundation

public struct LocalizedTime: Sendable, Equatable {
  
  public let utcTimestamp: TimeInterval
  public let timeZone: TimeZone
  
  // MARK: - Init
  public init(
    timestamp: TimeInterval,
    timeZoneIdentifier: String
  ) {
    self.utcTimestamp = timestamp
    // timeZone 기본값 UTC
    self.timeZone = TimeZone(identifier: timeZoneIdentifier) ?? TimeZone(secondsFromGMT: 0)!
  }

  var date: Date {
    Date(timeIntervalSince1970: utcTimestamp)
  }
  
  // MARK: - Display Formats
  
  /// "hh:mm" → "02:30"
  public var hhmm: String {
    formatted("hh:mm")
  }
  
  /// "yyyy.MM.dd" → "2025.08.15"
  public var yyyyMMdd: String {
    formatted("yyyy.MM.dd")
  }
  
  /// AM/PM → "오전" or "PM"
  public var meridiem: String {
    formatted("a")
  }
  
  /// 요일 → "금요일" or "Friday"
  public var eeee: String {
    formatted("EEEE")
  }
  
  private func formatted(
    _ format: String,
    locale: Locale = .current
  ) -> String {
    let formatter = DateFormatter()
    formatter.timeZone = timeZone
    formatter.locale = locale
    formatter.dateFormat = format
    return formatter.string(from: date)
  }
}
