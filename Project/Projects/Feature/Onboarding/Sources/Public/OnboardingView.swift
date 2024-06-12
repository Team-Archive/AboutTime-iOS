//
//  OnboardingView.swift
//  OnboardingView
//
//  Created by Aaron Hanwe LEE on 1/29/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import ArchiveFoundation
import UIComponents
import AppRoute

// swiftlint:disable:next generic_type_name
public struct OnboardingView<ServiceSignInDelegatorView>: View where ServiceSignInDelegatorView: ServiceSignInDelegator {
  
  // MARK: - Private Property
  
  private let store: StoreOf<OnboardingReducer>
  @State private var termsViewHeight: CGFloat = 0
  
  // MARK: - Internal Property
  
  // MARK: - Life Cycle
  
  public init(
    reducer: OnboardingReducer
  ) {
    self.store = .init(initialState: reducer.initialState, reducer: {
      return reducer
    })
  }
  
  public var body: some View {
    
    WithViewStore(store, observe: { $0 }) { viewStore in
      ZStack {
        ATBackgroundView()
          .ignoresSafeArea(.all)
        VStack {
          Spacer()
          Spacer()
          Spacer()
          
          Gen.Images.logo.image
          
          Spacer()
          Spacer()
          Spacer()
          
          VStack(spacing: 16) {
            ATSignInButton(type: .apple, action: {
              viewStore.send(.oauthSignIn(.apple))
            })
            ATSignInButton(type: .google, action: {
              viewStore.send(.oauthSignIn(.google))
            })
            ATSignInButton(type: .facebook, action: {
              viewStore.send(.oauthSignIn(.facebook))
            })
          }
          .padding(.designContentsSideInsets)
          
          Spacer()
        }
        .sheet(isPresented: viewStore.binding(
          get: { $0.isShowTerms },
          send: { _ in OnboardingReducer.Action.setIsShowTerms(false) })
        ) {
          OnboardingTermsView(
            contentsHeight: self.$termsViewHeight,
            completeAction: {
              viewStore.send(.agreeAllTerms)
          })
          .presentationDetents([.height(self.termsViewHeight)])
        }
        .sheet(isPresented: viewStore.binding(
          get: { $0.isShowNotificationAgree },
          send: { _ in OnboardingReducer.Action.setIsShowNotificationAgree(false) })
        ) {
          OnboardingNotificationAgreeView(completeAction: {
            viewStore.send(.doneNotificationAgree)
          })
          .presentationDetents([.fraction(0.35)])
        }
        .fullScreenCover(isPresented: viewStore.binding(
          get: { $0.isShowSignUp },
          send: { _ in OnboardingReducer.Action.setIsShowSignUp(false) })) {
            ServiceSignInDelegatorView { signInToken in
              viewStore.send(.signInService(signInToken))
            } closeAction: {
              viewStore.send(.setIsShowSignUp(false))
            }
        }
        
        if viewStore.isLoading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Gen.Colors.white.color))
            .scaleEffect(1.5)
        }
      }
    }
    
  }
  
  // MARK: - Private Method
  
  // MARK: - Internal Method
  
}
