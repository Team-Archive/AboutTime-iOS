//
//  MyProfileEntryView.swift
//  MyProfile
//
//  Created by jinyoung on 7/28/25.
//  Copyright © 2025 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation
import Domain
import Calendar
import UIComponents
import ComposableArchitecture

public struct MyProfileEntryView: View {
  
  @State private var path = NavigationPath()
  
  @State var hasPost: Bool = false
  
  @State private var calendarStore: StoreOf<CalendarReducer>
  
  public init() {
    let reducer = CalendarReducer(
      selectedMonth: Date(),
      useCase: CalendarUsecaseImpl(
        repository: StubCalendarRepositoryImpl()
      )
    )
    _calendarStore = State(initialValue: Store(initialState: reducer.initialState, reducer: {
      reducer
    }))
  }
  
  public var body: some View {
    NavigationStack(path: $path) {
      ZStack {
        ATBackgroundView()
          .edgesIgnoringSafeArea(
            .all
          )
        
        VStack {
          ATNavigationBar(
            type: .default(
              trailingIcon: Gen.Images.setting24.image,
              backAction: nil,
              trailingAction: {
                path.append("profileEdit")
              }
            )
          )
          .navigationDestination(for: String.self) { value in
            if value == "profileEdit" {
              MyProfileEditView(
                displayData: MyProfileEditDisplayData.mockData()
              )
            }
          }
          
          ScrollViewReader { proxy in
            GeometryReader { geometry in
              ScrollView(.vertical) {
                VStack {
                  MyProfileHeaderView(
                    Profile.mockData()
                  ) {
                      print("profile edit clicked")
                    }
                  
                  MonthRecapView(
                    month: "7월",
                    data: RecapCardType.mockData()
                  ) {
                    path.append("recapAll")
                  }
                  .navigationDestination(for: String.self) { value in
                    if value == "recapAll" {
                      MyProfileRecapEntryView(
                        month: "7월",
                        cards: RecapCardType.mockData()
                      )
                    }
                  }
                  
                  Spacer()
                    .frame(height: 20)
                  
                  CalendarView(
                    store: calendarStore,
                    selectHandler: { selectedDate in
                      guard let selectedData = selectedDate,
                            let hasData = selectedData.photoURL else {
                        self.hasPost = false
                        return
                      }
                      
                      self.hasPost = true
                    },
                    scrollViewProxy: proxy
                  ).padding(.horizontal, 20)
                  
                  Spacer()
                    .frame(height: 20)
                  
                  if hasPost {
                    PostItemView(
                      geometry: geometry,
                      data: PostItemData.mockData(imageCount: Int.random(in: 1...10))
                    )
                  } else {
                    Text("올린 소식이 없어요")
                      .font(.fonts(.bodyBold14))
                      .foregroundStyle(Gen.Colors.gray300.color)
                      .padding(.top, 204)
                  }
                  
                  Spacer(minLength: 341)
                  
                  Spacer()
                }
              }
            }
          }
        }
      }
    }
  }
}
