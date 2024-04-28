//
//  TabView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 28/04/24.
//

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: SelectedTab = .vacancyList

    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    
                    ViewFactory.build(.vacancyList)
                        .tabItem({
                            Label("Главная", systemImage: "doc.text.magnifyingglass")
                        })
                        .tag(SelectedTab.vacancyList)
                        
                    ViewFactory.build(.response)
                        .tabItem({
                            Label("Отклики", systemImage: "hand.thumbsup")
                        })
                        .tag(SelectedTab.response)
                    
                    ViewFactory.build(.profile)
                        .tabItem({
                            Label("Профиль", systemImage: "person")
                        })
                        .tag(SelectedTab.profile)
                }
            }
        }
    }
}

private enum SelectedTab: Int {
    case vacancyList, response, profile
}

