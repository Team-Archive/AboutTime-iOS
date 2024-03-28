//
//  ATSignInButton.swift
//  ArchiveUIComponents
//
//  Created by Aaron Hanwe LEE on 3/13/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI

public struct ATSignInButton: View {
  
  public enum SignInButtonType {
    case apple
    case google
    case facebook
    
    var iconImage: Image {
      switch self {
      case .apple:
        return Gen.Images.appleMini.swiftUIImage
      case .google:
        return Gen.Images.googleMini.swiftUIImage
      case .facebook:
        return Gen.Images.facebookMini.swiftUIImage
      }
    }
    
    var backgroundColor: Color {
      switch self {
      case .apple:
        return Gen.Colors.apple.swiftUIColor
      case .google:
        return Gen.Colors.google.swiftUIColor
      case .facebook:
        return Gen.Colors.facebook.swiftUIColor
      }
    }
    
    var textColor: Color {
      switch self {
      case .apple:
        return Gen.Colors.white.swiftUIColor
      case .google:
        return Gen.Colors.black.swiftUIColor
      case .facebook:
        return Gen.Colors.black.swiftUIColor
      }
    }
    
    var borderColor: Color {
      switch self {
      case .apple:
        return Gen.Colors.apple.swiftUIColor
      case .google:
        return Gen.Colors.black.swiftUIColor
      case .facebook:
        return Gen.Colors.facebook.swiftUIColor
      }
    }
    
    var contents: String {
      switch self {
      case .apple:
        return L10n.Localizable.signInApple
      case .google:
        return L10n.Localizable.signInGoogle
      case .facebook:
        return L10n.Localizable.signInFacebook
      }
    }
  }
  
  // MARK: - public state
  
  // MARK: - private properties
  
  private let type: SignInButtonType
  
  // MARK: - public properties
  
  public var action: () -> Void
  
  // MARK: - life cycle
  
  public var body: some View {
    
    Button(action: {
      
    }, label: {
      HStack {
        Spacer()
        self.type.iconImage
          .renderingMode(.original)
        Text(self.type.contents)
          .font(.fonts(.sample))
          .foregroundStyle(self.type.textColor)
        Spacer()
      }
      .frame(height: 56)
      .background(self.type.backgroundColor)
      .clipShape(.rect(cornerRadius: 28))
      .overlay(
        RoundedRectangle(cornerRadius: 28)
          .stroke(self.type.borderColor, lineWidth: 1)
      )
      .padding([.leading, .trailing], 20)
    })

  }
  
  public init(
    type: SignInButtonType,
    action: @escaping () -> Void
  ) {
    self.type = type
    self.action = action
  }
  
  // MARK: - private method
  
  // MARK: - internal method
  
}

#Preview {
  VStack {
    ATSignInButton(type: .apple, action: {
      print("apple!")
    })
    ATSignInButton(type: .google, action: {
      print("google!")
    })
    ATSignInButton(type: .facebook, action: {
      print("facebook!")
    })
  }
  
}