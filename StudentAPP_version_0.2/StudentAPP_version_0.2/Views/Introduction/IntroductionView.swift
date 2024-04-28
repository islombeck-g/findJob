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
                        Text("Здравствуйте!")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                        
                        Text("Биржа талантов - возможность \n получить любимую работу")
                            .font(.system(size: 20))
                        
                    }
                    .foregroundStyle(Color("SecondaryColor"))
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    
                    Group {
                        NavigationLink {
                            ViewFactory.build(.signIn)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 343, height: 46)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Title4Text(color: Color("ForegroundColor"), text: "Вход")
                            }
                        }
                        
                        NavigationLink {
                            ViewFactory.build(.createAccount)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color("SecondaryColor"), lineWidth: 2)
                                    .frame(width: 343, height: 46)
                                
                                Title4Text(color: Color("SecondaryColor"), text: "Регистрация")
                                    .bold()
//                                Text(LocalizedStringKey("Регистрация"))
//                                    .foregroundStyle(Color("SecondaryColor"))
//                                    .fontWeight(.bold)
                            }
                        }
                        
                        
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    IntroductionView()
}


