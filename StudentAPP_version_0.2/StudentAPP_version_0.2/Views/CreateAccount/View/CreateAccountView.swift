//
//  CreateAccount.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 27/04/24.
//

import SwiftUI

struct CreateAccountView<ViewModel>: View where ViewModel: CreateAccountViewModelProtocol {
    
    @StateObject var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color("ForegroundColor")
                .ignoresSafeArea()
            
            
            let views: [AnyView] = [
                AnyView(FIOEnterField(firstName: $viewModel.user.firstName,
                                      secondName: $viewModel.user.secondName,
                                      patronymicName: $viewModel.user.patronymicName,
                                      action: viewModel.nextEnterDataView)),
                AnyView(SecuredEnterField(phoneNumber: $viewModel.user.phoneNumber,
                                          university: $viewModel.user.university,
                                          action: viewModel.nextEnterDataView))]
            
            VStack {
                Spacer()
                    .frame(height: 37.5)
                
                CustomSizeText(color: Color("SecondaryColor"), text: "Регистрация", size: 38)
                    .padding(.horizontal, 16)
                
                
                TabView(selection: $viewModel.nextView) {
                    ForEach( views.indices, id: \.self) { i in
                        views[i]
                    }
                    .padding(.horizontal, 16)
                }
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationBackButton(callback: viewModel.cleanData)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
            
        }
    }
}



#if DEBUG
#Preview {
    CreateAccountView(viewModel: CreateAccountViewModel())
}
#endif
