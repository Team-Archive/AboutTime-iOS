//
//  SampleApp.swift
//  MyProfile
//
//  Created by jinyoung on 7/16/24.
//  Copyright © 2024 TeamArchive. All rights reserved.
//

import SwiftUI
import ArchiveFoundation
import Domain
import Calendar
import UIComponents
import MyProfile
import ComposableArchitecture

@main
struct SampleApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

struct ContentView: View {
  
  @State var hasPost: Bool = false
  
  @State private var calendarStore: StoreOf<CalendarReducer>
  
  let dummyPostData = PostItemData.mockData(imageCount: 5)
  
  init() {
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
  
  var body: some View {
    ZStack {
      ATBackgroundView()
        .edgesIgnoringSafeArea(
          .all
        )
      
      VStack {
        ATNavigationBar(
          type: .default(
            backAction: nil,
            trailingAction: nil
          )
        )
        
        ScrollViewReader { proxy in
          GeometryReader { geometry in
            ScrollView(.vertical) {
              VStack {
                MyProfileHeaderView(
                  Profile(
                    userID: 1,
                    name: "수지",
                    time: "10:40 PM",
                    region: "🇨🇦 Montreal, Canada",
                    weather: ATWeather(
                      tag: .cloudy,
                      temperature: 21
                    ),
                    imageURL: MockImageURL.fetchData()
                  )) {
                    print("profile edit clicked")
                  }
                
                MonthRecapView(
                  month: "7월",
                  data: [
                    .profile(
                      RecapProfileData(
                        imageURL: MockImageURL.fetchDatas(with: 1).first!,
                        type: .communicate
                      )
                    ),
                    .profile(
                      RecapProfileData(
                        imageURL: MockImageURL.fetchDatas(with: 1).first!,
                        type: .reaction
                      )
                    ),
                    .post(
                      RecapPostData(
                        imageURL: MockImageURL.fetchDatas(with: 1).first!,
                        type: .reaction
                      )
                    ),
                    .text(
                      RecapTextData(
                        content: "6PM-9PM",
                        type: .timeRange
                      )
                    ),
                    .text(
                      RecapTextData(
                        content: "7월 7일",
                        type: .day
                      )
                    ),
                    .text(
                      RecapTextData(
                        content: "30회",
                        type: .upload
                      )
                    )
                  ]) {
                    print("모두보기 클릭")
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
