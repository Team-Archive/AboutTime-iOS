//
//  ATBottomActionButton.swift
//  UIComponents
//
//  Created by Aaron Hanwe LEE on 4/23/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI

public struct ATBottomActionButton: View {
  
  public enum ButtonDesignType {
    case primary
    case secondary
  }
  
  // MARK: - public state
  
  @Binding var isEnabled: Bool
  
  // MARK: - private properties
  
  private let icon: Image?
  private let title: String
  private let designType: ButtonDesignType
  private let buttonHeight: CGFloat = 52
  private var defaultButtonCornerRadius: CGFloat {
    return self.buttonHeight/2
  }
  @State private var leftRightPadding: CGFloat = .designContentsInset
  @State private var buttonCornerRadius: CGFloat = 26
  
  private var textColor: Color {
    if self.isEnabled {
      switch self.designType {
      case .primary:
        return Gen.Colors.white.color
      case .secondary:
        return Gen.Colors.purpleGray500.color
      }
    } else {
      return Gen.Colors.gray200.color
    }
  }
  
  private var backgroundStartColor: Color {
    if self.isEnabled {
      switch self.designType {
      case .primary:
        return Gen.Colors.gradationMainStart.color
      case .secondary:
        return Gen.Colors.white.color
      }
    } else {
      return Gen.Colors.gray300.color
    }
  }
  
  private var backgroundEndColor: Color {
    if self.isEnabled {
      switch self.designType {
      case .primary:
        return Gen.Colors.gradationMainEnd.color
      case .secondary:
        return Gen.Colors.white.color
      }
    } else {
      return Gen.Colors.gray300.color
    }
  }
  
  private var font: Font {
    if self.isEnabled {
      return .fonts(.buttonExtraBold14)
    } else {
      return .fonts(.body14)
    }
  }
  
  
  // MARK: - public properties
  
  public var action: () -> Void
  
  // MARK: - life cycle
  
  public var body: some View {
    
    Button(action: {
      self.action()
    }, label: {
      ZStack {
        LinearGradient(
          gradient: Gradient(
            colors: [
              self.backgroundStartColor,
              self.backgroundEndColor
            ]),
          startPoint: .top,
          endPoint: .bottom
        )
        HStack(spacing: 4) {
          Spacer()
          if let icon {
            icon
              .renderingMode(.template)
              .tint(self.textColor)
              .frame(width: 20, height: 20)
          }
          Text(self.title)
            .font(self.font)
            .foregroundStyle(self.textColor)
          Spacer()
        }
      }
      .frame(height: self.buttonHeight)
      .clipShape(.rect(cornerRadius: self.buttonCornerRadius))
      .padding([.leading, .trailing], self.leftRightPadding)
    })
    .disabled(!self.isEnabled)
    .onAppear {
      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { _ in
        withAnimation {
          self.leftRightPadding = 0
          self.buttonCornerRadius = 0
        }
      }
      NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
        withAnimation {
          self.leftRightPadding = .designContentsInset
          self.buttonCornerRadius = self.defaultButtonCornerRadius
        }
      }
    }
    .onDisappear {
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

  }
  
  public init(
    designType: ButtonDesignType = .primary,
    icon: Image? = nil,
    title: String,
    action: @escaping () -> Void,
    isEnabled: Binding<Bool> = .constant(true)
  ) {
    self.designType = designType
    self.icon = icon
    self.title = title
    self._isEnabled = isEnabled
    self.action = action
  }
  
  // MARK: - private method
  
  // MARK: - internal method
  
}

#Preview {
  VStack {
    ATBottomActionButton(icon: .init(systemName: "bolt"), title: "hola", action: {
      print("hola")
    })
  }
  
}
