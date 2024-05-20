//
//  CameraUsecaseImplement.swift
//  Domain
//
//  Created by hanwe on 5/19/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import ArchiveFoundation
import AVFoundation

public final class CameraUsecaseImplement: CameraUsecase {
  
  // MARK: private property
  
  private let repository: CameraRepository
  
  // MARK: public property
  
  public var session: AVCaptureSession {
    return self.repository.session
  }
  
  // MARK: lifeCycle
  
  public init(
    repository: CameraRepository
  ) {
    self.repository = repository
  }
  
  // MARK: private function
  
  // MARK: public function
  
  public func checkCameraAuthorization() async -> AVAuthorizationStatus {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    switch status {
    case .notDetermined:
      return await withCheckedContinuation { continuation in
        AVCaptureDevice.requestAccess(for: .video) { granted in
          let newStatus = AVCaptureDevice.authorizationStatus(for: .video)
          continuation.resume(returning: newStatus)
        }
      }
    default:
      return status
    }
  }
  
  public func startSession() {
    self.repository.startSession()
  }
  
  public func stopSession() {
    self.repository.stopSession()
  }
  
  public func takePhoto() async -> Data? {
    return await self.repository.takePhoto()
  }
  
  public func switchCamera() {
    self.repository.switchCamera()
  }
  
}
