//
//  SignInView.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct SignInView<ViewModel>: View where ViewModel: SignInViewModelProtocol {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color("ForegroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading){
                    
                    Group {
                        Spacer()
                            .frame(height: 37.5)
                        
                        CustomSizeText(color: Color("SecondaryColor"), text: "Вход", size: 38)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                            .frame(height: 24)
                    }
                    .padding(.leading, 8)
                    
                    SignInEnterDataForm(email: $viewModel.email ,
                                        password: $viewModel.password ,
                                        action: viewModel.trySignIn)
                    .frame(
                        width: 343,
                        height: 287)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                        .frame(height: 24)
                    
                    Text(LocalizedStringKey("Войти с помощью"))
                        .foregroundStyle(Color("SecondaryColor"))
                        .frame(maxWidth: .infinity)
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(
                                    width: 343,
                                    height: 48)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("SecondaryColor"))
                            
                            Image("vk_icon")
                                .fontWeight(.bold)
                        }
                    }
                    Button {
                        viewModel.email = "some@gmail.com"
                        viewModel.password = "passwordIsHere"
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(
                                    width: 343,
                                    height: 48)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("SecondaryColor"))
                            
                            Text("Test Data")
                                .fontWeight(.bold)
                        }
                    }
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
            
            if viewModel.isLoading {
                ProgressView()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                NavigationBackButton(callback: viewModel.cleanData)
            }
        }
    }
}
