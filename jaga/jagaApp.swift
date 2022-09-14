//
//  jagaApp.swift
//  jaga
//
//  Created by 이한규 on 2021/07/23.
//

import SwiftUI
//page1에서 한 멘트 더하려면 page1 specialeffect 있어야한다.
//현재 마지막 scene은 무조건 additional_2page에 간다는 가정하에 작성하였다.

@main
struct jagaApp: App {
    var body: some Scene {
        WindowGroup {
            //ontap()
            ContentView(viewRouter: ViewRouter())
            //SwiftUIView2()
            //SwiftUIView()
        }
    }
}
