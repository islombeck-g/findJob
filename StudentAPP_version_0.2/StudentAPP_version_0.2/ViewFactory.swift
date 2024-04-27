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
        case main
        case cv
    }
    
    enum MainModule {
        case vacancyList
        case vacancyDetail
    }
    
    @ViewBuilder static func build(_ module: AuthModule) -> some View {
        switch module {
        case let .introductionView:
            IntroductionViewBuilder.build()
        case let .createAccount:
            CreateAccountViewBuilder.build()
        case .signIn:
            SignInViewBuilder.build()
        }
    }
    
    @ViewBuilder static func build(_ module: ProfileModule) -> some View {
        switch module {
        case let main: 
            EmptyView()
        case let cv:
            EmptyView()
        }
    }
 
    @ViewBuilder static func build(_ module: MainModule) -> some View {
        switch module {
        case let vacancyList:
            EmptyView()
        case let vacancyDetail:
            EmptyView()
        }
    }
    
}



enum IntroductionViewState {
    case authorized
    case notAuthorized
}
