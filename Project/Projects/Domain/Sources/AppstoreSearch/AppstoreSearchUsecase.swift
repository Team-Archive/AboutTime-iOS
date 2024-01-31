//
//  AppstoreSearchUsecase.swift
//  Sample
//
//  Created by Aaron Hanwe LEE on 1/30/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import UIKit
import Combine
import ArchiveFoundation

public class AppstoreSearchUsecase: AppstoreSearchUsecaseInterface {
  
  // MARK: - private properties
  
  private let repository: AppstoreSearchRepository
  private let limit: UInt = 10
  private var currentPage: UInt = 0
  private var searchKeyword: String?
  
  // MARK: - internal properties
  
  // MARK: - life cycle
  
  private init(repository: AppstoreSearchRepository) {
    self.repository = repository
  }
  
  // MARK: - private method
  
  // MARK: - public method
  
  public static func makeObject(repository: AppstoreSearchRepository) -> AppstoreSearchUsecaseInterface {
    return AppstoreSearchUsecase(repository: repository)
  }
  
  public func search(keyword: String) -> AnyPublisher<[AppstoreApp], ArchiveError> {
    self.currentPage = 0
    return self.repository.search(
      keyword: keyword,
      offset: self.currentPage,
      limit: self.limit
    )
  }
  
  public func morePage() {
    
  }
  
}
