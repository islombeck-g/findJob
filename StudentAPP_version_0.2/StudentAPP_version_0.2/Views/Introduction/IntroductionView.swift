//
//  IntroductionView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct IntroductionView: View {
    @StateObject var userStateManager = UserStateManager.shared
    @State private var shouldNavigateToTabView = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color("ForegroundColor")
                    .ignoresSafeArea()
                VStack {
                    Group {
                        CustomSizeText(alignment: .center,
                                       text: Localizable.hello.localized,
                                       size: 30)
                        CustomSizeText(alignment: .center,
                                       text: Localizable.talentExchange.localized,
                                       size: 20)
                    }
                    .padding(.horizontal)

                    NavigationLink {
                        ViewFactory.build(.signIn)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 343, height: 46)
                                .foregroundColor(Color("SecondaryColor"))
                            Title4Text(color: Color("ForegroundColor"),
                                       text: Localizable.login.localized)
                        }
                    }
                    NavigationLink {
                        ViewFactory.build(.createAccount)
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color("SecondaryColor"), lineWidth: 2)
                                .frame(width: 343, height: 46)
                            Title4Text(color: Color("SecondaryColor"),
                                       text:  Localizable.registration.localized)
                        }
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}
