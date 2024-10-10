//
//  ReadWriteDataUsecase.swift
//  Domain
//
//  Created by hanwe on 6/22/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import ArchiveFoundation
import Foundation

public protocol ReadWriteDataUsecase {
  func write(key: String, data: Data) async -> Result<Void, ArchiveError>
  func read(key: String) async -> Result<Data?, ArchiveError>
  func update(key: String, data: Data) async -> Result<Void, ArchiveError>
  func delete(key: String) async -> Result<Void, ArchiveError>
}
