//
//  ViewFactory.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import Foundation
import SwiftUI

struct ViewFactory {
    enum AuthModule {
        case createAccount
        case signIn
        case introductionView
    }
    
    enum ProfileModule {
        case profile
        case cv
    }
    
    enum MainModule {
        case vacancyList
        case vacancyDetail
        case tabView
    }
    
    enum ResponseModule {
        case response
    }
    
    @ViewBuilder static func build(_ module: AuthModule) -> some View {
        switch module {
        case .introductionView:
            IntroductionViewBuilder.build()
        case .createAccount:
            CreateAccountViewBuilder.build()
        case .signIn:
            SignInViewBuilder.build()
        }
    }
    
    @ViewBuilder static func build(_ module: ProfileModule) -> some View {
        switch module {
        case .profile:
            ProfileViewBuilder.build()
        case .cv:
            CVListViewBuilder.build()
        }
    }
 
    @ViewBuilder static func build(_ module: MainModule) -> some View {
        switch module {
        case .vacancyList:
            VacancyBoardViewBuilder.build()
        case .vacancyDetail:
            EmptyView()
        case .tabView:
            MainTabViewBuilder.build()
        }
    }
    
    @ViewBuilder static func build(_ module: ResponseModule) -> some View {
        switch module {
        case .response:
            MessangerViewListBuilder.build()
        }
    }
}





//    .onChange(of: userStateManager.userState) { newValue in
//                if userStateManager.userState == .authorized {
//                    shouldNavigateToTabView = true // Update the state variable
//                    print(userStateManager.userState)
//                }
//            }
//            .background(
//                NavigationLink(
//                    destination: ViewFactory.build(.tabView),
//                    isActive: $shouldNavigateToTabView,
//                    label: { EmptyView() }
//                )
//                .isDetailLink(false)
//            )
